from rest_framework import serializers
# from rest_framework.validators import FileExtensionValidator
import speech_recognition as sr
from gtts import gTTS
import google.generativeai as genai
from .serializers import AudioSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

GOOGLE_API_KEY = "AIzaSyCNYiMfklFl872gM_O6OvBVLYt4hm74ISc"
lang = 'en'


def get_audio(audio_data):
    r = sr.Recognizer()
    # print(audio_data)
    try:
        # audio_data = r.record(audio_data)
        with sr.WavFile("core\wmf.wav") as source:              # use "test.wav" as the audio source
            audio_data = r.record(source)
        print(audio_data)
        text_prompt = r.recognize_google(audio_data)
        genai.configure(api_key=GOOGLE_API_KEY)
        model = genai.GenerativeModel('gemini-pro')
        response = model.generate_content(text_prompt)
    #     response_to_speech = gTTS(text=response.text, lang=lang, slow=False, tld="com.au")
    # except sr.UnknownValueError:
        raise ValueError("Speech Recognition could not understand audio")
    except sr.RequestError as e:
        raise ValueError(f"Could not request results from Google Speech Recognition service; {e}")
    except Exception as e:
        print({'error': str(e), 'line_number': e.__traceback__.tb_lineno})
        raise e

    return response


class AiEmergencyAdvisor(APIView):
    def post(self, request, format=None):
        serializer = AudioSerializer(data=request.data)
        if serializer.is_valid():
            audio_data = serializer.validated_data['audio_prompt']
            print(audio_data)
            try:
                response = get_audio(audio_data)
                return Response({'response': response})
            except Exception as e:
                return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
