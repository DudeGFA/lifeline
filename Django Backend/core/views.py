from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from rest_framework.decorators import api_view, permission_classes
from django.contrib.auth.decorators import login_required
from rest_framework.permissions import IsAuthenticated
from .serializers import RegisterSerializer, UserProfileSerializer, MedicalPractitionerSerializer, EmergencyMessageSerializer, EmergencyContactSerializer, MedicalPractitionerListSerializer
from .models import Meeting, UserProfile, MedicalPractitioner
import nexmo
from django.conf import settings
import googlemaps
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import uuid, secrets
from django.db import IntegrityError
from .forms import NewUserForm
from django.contrib.auth.models import User
from rest_framework import generics


def create_user():
    random_password = secrets.token_urlsafe(16)
    while (True):
        try:
            user_id = uuid.uuid4()
            newform = NewUserForm({'username': user_id, 'password1': random_password, 'password2': random_password, 'email':'lifelineuser@gmail.com'})
            if newform.is_valid():
                new_user = newform.save()
                new_user_profile = UserProfile.objects.create(user=new_user)
                return new_user.username
            else:
                print(newform.errors)
        except IntegrityError as e:
            print(e)
            pass

def create_md_user():
    random_password = secrets.token_urlsafe(16)
    while (True):
        try:
            user_id = uuid.uuid4()
            newform = NewUserForm({'username': user_id, 'password1': random_password, 'password2': random_password, 'email':'lifelineuser@gmail.com'})
            if newform.is_valid():
                new_user = newform.save()
                new_user_profile = MedicalPractitioner.objects.create(user=new_user)
                return new_user.username
            else:
                print(newform.errors)
        except IntegrityError as e:
            print(e)
            pass

@api_view(['GET'])
def get_routes(request):
    routes = [
        {
            'Endpoint': '/video/',
            'method': 'GET',
            'body': None,
            'description': 'Get available video chat routes.'
        },
        {
            'Endpoint': '/video_call/{room_name}/',
            'method': 'POST',
            'body': None,
            'description': 'Initiate a video chat with a medical professional. Provide a unique room_name in the URL.'
        },
    ]
    return Response(routes)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def register(request):
    if request.method == 'POST':
        serializer = RegisterSerializer(data=request.data)
        try:
            if serializer.is_valid():
                serializer.save()
                return redirect('login')
            else:
                # Return validation errors with status code 400
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            # Handle other exceptions and return appropriate error response
            return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    return render(request, 'register.html')


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def login_view(request):
    if request.method == 'POST':
        email = request.data.get('email')
        password = request.data.get('password')
        user = authenticate(request, username=email, password=password)
        try:
            if user is not None:
                login(request, user)
                return redirect('dashboard')
            else:
                return render(request, 'login.html', {'error': "Invalid credentials. Please try again."})
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    return render(request, 'login.html')

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def dashboard(request):
    return render(request, 'dashboard.html', {'name': request.user.first_name})


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def video_chat(request):
    return render(request, 'video_chat.html', {'name': request.user.first_name + " " + request.user.last_name})


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def logout_view(request):
    logout(request)
    return redirect('login')


@api_view(['POST'])
def join_room(request):
    if request.method == 'POST':
        room_id = request.data.get('roomID')
        meeting = Meeting.objects.create(room_id=room_id, organizer=request.user)
        meeting.save()
        return redirect(f"/meeting?roomID={room_id}")
    return render(request, 'joinroom.html')


class UserProfileView(APIView):
    def get(self, request, username=None):
        if username is None:
            try:
                username = create_user()
            except Exception as e:
                return Response({'error-something went wrong': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        user = get_object_or_404(User, username=username)
        serializer = UserProfileSerializer(instance=user.userprofile)
        return Response({'username': username, 'data': serializer.data})

    def post(self, request, username=None):
        if username is None:
            username = create_user()
        print(username)
        user = get_object_or_404(User, username=username)
        serializer = UserProfileSerializer(instance=user.userprofile, data=request.data)
        if serializer.is_valid():
            serializer.save()
        else:
            return Response({'error': serializer.errors})
        if request.data.get("emergency_contact"):
            emc_serializer = EmergencyContactSerializer(data=request.data.get("emergency_contact"), many=True)
            if emc_serializer.is_valid():
                new_emc = emc_serializer.save(commit=false)
                new_emc.user = user
                new_emc.save()
                return Response({'user_id':username, 'data': serializer.data})
            else:
                return Response({'user_id':username, 'data': serializer.data,'error': emc_serializer.errors})
        else:
            return Response({'user_id':username, 'data': serializer.data})

class MedicalProfileView(APIView):
    def get(self, request, username=None):
        if username is None:
            try:
                username = create_md_user()
            except Exception as e:
                return Response({'error-something went wrong': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        user = get_object_or_404(User, username=username)
        serializer = MedicalPractitionerSerializer(instance=user.medicalpractitioner)
        return Response({'username': username, 'data': serializer.data})

    def post(self, request, username=None):
        if username is None:
            username = create_md_user()
        print(username)
        user = get_object_or_404(User, username=username)
        serializer = MedicalPractitionerSerializer(instance=user.medicalpractitioner, data=request.data)
        if serializer.is_valid():
            serializer.save()
        else:
            return Response({'error': serializer.errors})
        return Response({'user_id':username, 'data': serializer.data})

class MedicalPractitionersListView(generics.ListAPIView):
    queryset = MedicalPractitioner.objects.all()
    serializer_class = MedicalPractitionerListSerializer

@login_required
@api_view(['GET', 'POST'])
def medical_practitioner_profile(request):
    if request.method == 'POST':
        serializer = MedicalPractitionerSerializer(instance=request.user.medicalpractitioner, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return redirect('medical_practitioner_profile')
        else:
            return render(request, 'medical_practitioner_profile.html', {'form': serializer.errors})
    else:
        serializer = MedicalPractitionerSerializer(instance=request.user.medicalpractitioner)
        return render(request, 'medical_practitioner_profile.html', {'form': serializer.data})

def doctor_dashboard(request):
    user_profile = request.user.userprofile
    is_doctor = user_profile.is_doctor
    return JsonResponse({'is_doctor': is_doctor})


class EmergencyMessageViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = EmergencyMessageSerializer(data=request.data)
        if serializer.is_valid():
            location = serializer.validated_data.get('location')
            if not location:
                return Response({'status': 'error', 'message': 'Location is required'}, status=400)

            # Getting user profile details
            user_profile = request.user.userprofile
            profile_name = user_profile.get_full_name()
            profile_address = user_profile.home_address
            # Include any other profile details you want to include in the message

            gmaps = googlemaps.Client(key=settings.GOOGLE_MAPS_API_KEY)

            places_result = gmaps.places_nearby(location=location, radius=5000, type='hospital')

            if places_result['status'] == 'OK':
                nearest_hospital = places_result['results'][0]
                hospital_name = nearest_hospital['name']
                hospital_location = nearest_hospital['vicinity']

                # Requesting additional details including the phone number
                place_id = nearest_hospital['place_id']
                details_result = gmaps.place(place_id)
                phone_number = details_result['result'].get('formatted_phone_number', 'Phone number not available')

                # Constructing the message including user profile details
                emergency_message = (
                    f"Emergency: Patient {profile_name} en route to {hospital_name} located at {hospital_location}. "
                    f"Address: {profile_address}. Phone: {phone_number}"
                )

                # Sending SMS using Nexmo
                try:
                    client = nexmo.Client(key=settings.NEXMO_API_KEY, secret=settings.NEXMO_API_SECRET)
                    response = client.send_message({
                        'from': settings.NEXMO_PHONE_NUMBER,
                        'to': phone_number,
                        'text': emergency_message,
                    })
                    return Response({'status': 'success', 'message': 'Emergency message sent successfully'})
                except Exception as e:
                    return Response({'status': 'error', 'message': str(e)})
            else:
                return Response({'status': 'error', 'message': 'No hospitals found nearby'})
        else:
            return Response(serializer.errors, status=400)

class CreateId(APIView):
    def post(self, request):
        try:
            username = create_user()
            context = {'user_id': username, 'appSignIn': '5607bfcf0d0d94700ecd6555096cd5f9dae5be2567359b0ccc7eb336c797c517', 'appID': '86357181'}
            return Response(context)
            
        except Exception as e:
            return Response({'error-something went wrong': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)