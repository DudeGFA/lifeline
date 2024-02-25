from django.contrib import admin

from .models import Meeting, UserProfile, EmergencyContact
admin.site.register(Meeting)
admin.site.register(UserProfile)
admin.site.register(EmergencyContact)