from rest_framework import serializers
from django.contrib.auth.models import User
from .models import UserProfile, MedicalPractitioner
from rest_framework import serializers
from .models import Meeting
import geopy.distance
from .models import EmergencyContact
from django.core.validators import FileExtensionValidator

class MeetingSerializer(serializers.ModelSerializer):
    organizer_name = serializers.SerializerMethodField()

    class Meta:
        model = Meeting
        fields = ['room_id', 'organizer', 'date_created', 'organizer_name']

    def get_organizer_name(self, obj):
        return obj.get_organizer_name()


class RegisterSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True)
    first_name = serializers.CharField(max_length=100, required=True)
    last_name = serializers.CharField(max_length=100, required=True)

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'password')

    def create(self, validated_data):
        user = User.objects.create_user(
            email=validated_data['email'],
            username=validated_data['email'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            password=validated_data['password']
        )
        return user


class EmergencyContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmergencyContact
        fields = ['relationship', 'first_name', 'phone_number']


class UserProfileSerializer(serializers.ModelSerializer):
    emergency_contact = EmergencyContactSerializer(read_only=True)

    class Meta:
        model = UserProfile
        fields = ['phone_number', 'relationship', 'home_address', 'preferred_hospital', 'conditions', 'allergies', 'medication_name', 'medication_dosage',
                  'medication_start_date', 'blood_type', 'organ_donor_status', 'preferred_language', 'profile_picture', 'emergency_contact']

    # def update(self, instance, validated_data):
    #     emergency_contact_data = validated_data.pop('emergency_contact')
    #     emergency_contact = instance.emergency_contact
    #     for attr, value in emergency_contact_data.items():
    #         setattr(emergency_contact, attr, value)
    #     emergency_contact.save()
    #     return super().update(instance, validated_data)

# class UserProfileSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = UserProfile
#         fields = ['phone_number', 'relationship', 'home_address', 'preferred_hospital', 'conditions', 'allergies', 'medication_name', 'medication_dosage',
#                   'medication_start_date', 'blood_type', 'organ_donor_status', 'preferred_language', 'profile_picture']


class MedicalPractitionerSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicalPractitioner
        fields = ['specialization', 'license_number', 'first_name', 'last_name', 'country', 'state', 'language', 'certification', 'med_profile_picture',
                  'first_aid_certification', 'cpr_certification']

class MedicalPractitionerListSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicalPractitioner
        fields = ['specialization', 'first_name', 'last_name', 'med_profile_picture']

class EmergencyMessageSerializer(serializers.Serializer):
    location = serializers.CharField(max_length=100)

    def __init__(self, *args, **kwargs):
        self.latitude = kwargs.pop('latitude', None)
        self.longitude = kwargs.pop('longitude', None)
        super().__init__(*args, **kwargs)


    def validate_location(self, value):
        if not value:
            raise serializers.ValidationError("Location cannot be empty")

        # Checking if location coordinates are within a certain range
        # Ensuring that the location is within a specified geographical area

        if self.latitude is None or self.longitude is None:
            raise serializers.ValidationError("Latitude and longitude must be provided")

        # Defining the center coordinates of the allowed area
        allowed_center = (self.latitude, self.longitude)

        # Converting the provided location coordinates to a tuple of floats
        try:
            location_coords = tuple(map(float, value.split(',')))  # Assuming location format: "latitude,longitude"
        except ValueError:
            raise serializers.ValidationError("Invalid location format")

        # Calculating the distance between the provided location and the allowed center
        distance_to_center = geopy.distance.geodesic(allowed_center, location_coords).kilometers

        # Defining the maximum allowed distance from the center in kilometers
        max_distance = 10  # Allowing locations within 10 kilometers of the center

        if distance_to_center > max_distance:
            raise serializers.ValidationError("Location is too far from the allowed area")

        return value

class AudioSerializer(serializers.Serializer):
    """
    Serializer for an audio file.
    """
    audio_prompt = serializers.FileField(
        allow_empty_file=False,
        validators=[
            FileExtensionValidator(allowed_extensions=['mp3', 'wav', 'ogg']),
        ]
    )
