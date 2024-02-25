from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import UserProfile
from .models import MedicalPractitioner

class RegisterForm(UserCreationForm):
    email = forms.EmailField(required=True)
    first_name = forms.CharField(max_length=100, required=True)
    last_name = forms.CharField(max_length=100, required=True)

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'password1', 'password2')
    
    def save(self, commit=True):
        user = super(RegisterForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        user.username = self.cleaned_data['email']
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']

        if commit:
            user.save()
        
        return user


class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['phone_number', 'relationship', 'home_address', 'preferred_hospital', 'conditions', 'allergies', 'medication_name', 'medication_dosage',
                  'medication_start_date', 'blood_type', 'organ_donor_status', 'preferred_language', 'profile_picture']


class MedicalPractitionerForm(forms.ModelForm):
    class Meta:
        model = MedicalPractitioner
        fields = ['specialization', 'license_number', 'first_name', 'last_name', 'country', 'state', 'language', 'certification', 'med_profile_picture',
                  'first_aid_certification', 'cpr_certification']


class NewUserForm(UserCreationForm):
	email = forms.EmailField(required=True)

	class Meta:
		model = User
		fields = ("username", "password1")

	def save(self, commit=True):
		user = super(NewUserForm, self).save(commit=False)
		user.username = self.cleaned_data['username']
		if commit:
			user.save()
		return user