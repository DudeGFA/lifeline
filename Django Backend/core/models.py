from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError


class EmergencyContact(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    relationship = models.CharField(max_length=50)
    first_name = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=20)

    def clean(self):
        # Custom model-level validation logic
        if self.phone_number and not self.phone_number.isdigit():
            raise ValidationError("Phone number must contain only digits.")


class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    is_doctor = models.BooleanField(default=False)
    phone_number = models.CharField(max_length=20, blank=True, null=True)
    relationship = models.CharField(max_length=20, blank=True, null=True)
    home_address = models.CharField(max_length=100, blank=True, null=True)
    preferred_hospital = models.CharField(max_length=100, blank=True, null=True)
    conditions = models.CharField(max_length=100, blank=True, null=True)
    allergies = models.CharField(max_length=100, blank=True, null=True)
    medication_name = models.CharField(max_length=100, blank=True, null=True)
    medication_dosage = models.CharField(max_length=100, blank=True, null=True)
    medication_start_date = models.CharField(max_length=100, blank=True, null=True)
    blood_type = models.CharField(max_length=10, blank=True, null=True)
    organ_donor_status = models.CharField(max_length=100, blank=True, null=True)
    preferred_language = models.CharField(max_length=10, blank=True, null=True)
    profile_picture = models.ImageField(upload_to='profile_pictures/', null=True, blank=True)

    def __str__(self):
        return self.user.username


class MedicalPractitioner(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    specialization = models.CharField(max_length=100, blank=True, null=True)
    license_number = models.CharField(max_length=50, blank=True, null=True)
    first_name = models.CharField(max_length=100, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    country = models.CharField(max_length=50, blank=True, null=True)
    state = models.CharField(max_length=50, blank=True, null=True)
    language = models.CharField(max_length=50, blank=True, null=True)
    certification = models.CharField(max_length=50, blank=True, null=True)
    med_profile_picture = models.ImageField(upload_to='profile_pictures/', null=True, blank=True)
    first_aid_certification = models.ImageField(upload_to='fa_certs/', null=True, blank=True)
    cpr_certification = models.ImageField(upload_to='cpr_certs/', null=True, blank=True)

    # def clean(self):
    #     # Custom model-level validation logic
    #     if not self.specialization:
    #         raise ValidationError("Specialization field is required.")


    def __str__(self):
        return self.user.username


class Meeting(models.Model):
    room_id = models.CharField(max_length=100, verbose_name="Room ID", help_text = "Unique identifier for the meeting room")
    organizer = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="Organizer", help_text="User who created the meeting")
    date_created = models.DateTimeField(auto_now_add=True, verbose_name="Date Created", help_text="Date and time when the meeting was created")

    def __str__(self):
        return self.room_id

    def get_organizer_name(self):
        return self.organizer.get_full_name() if self.organizer else "Unknown"


