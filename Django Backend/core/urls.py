from django.urls import path
from . import views
from .views import EmergencyMessageViewSet
from . import Ai_emergency_advisor

urlpatterns = [
    path('', views.get_routes),
    path('userprofile/', views.UserProfileView.as_view(), name='create_user_profile'),
    path('userprofile/:username/', views.UserProfileView.as_view(), name='user_profile'),
    path('login/', views.login_view, name='login'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('meeting/', views.video_chat, name='meeting'),
    path('logout/', views.logout_view, name='logout'),
    path('create_id/', views.CreateId.as_view(), name='create_id'),
    path('join/', views.join_room, name='join_room'),
    path('medical_practitioner_profile/', views.medical_practitioner_profile, name='medical_practitioner_profile'),
    path('medical_practitioner_profile/:username/', views.medical_practitioner_profile, name='medical_practitioner_profile'),
    path('nearby-hospitals/', EmergencyMessageViewSet.as_view({'post': 'create'}), name='nearby_hospitals'),
    path('ai_emergency_advisor/', Ai_emergency_advisor.AiEmergencyAdvisor.as_view(), name='ai_emergency_advisor'),
    path('medical_practitioners/', views.MedicalPractitionersListView.as_view(), name='medical_practitioners_list'),

]
