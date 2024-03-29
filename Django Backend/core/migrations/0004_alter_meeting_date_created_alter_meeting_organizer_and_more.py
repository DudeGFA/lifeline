# Generated by Django 5.0.2 on 2024-02-16 17:10

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_meeting_delete_video_chat'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterField(
            model_name='meeting',
            name='date_created',
            field=models.DateTimeField(auto_now_add=True, help_text='Date and time when the meeting was created', verbose_name='Date Created'),
        ),
        migrations.AlterField(
            model_name='meeting',
            name='organizer',
            field=models.ForeignKey(help_text='User who created the meeting', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Organizer'),
        ),
        migrations.AlterField(
            model_name='meeting',
            name='room_id',
            field=models.CharField(help_text='Unique identifier for the meeting room', max_length=100, verbose_name='Room ID'),
        ),
        migrations.CreateModel(
            name='EmergencyContact',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('relationship', models.CharField(max_length=50)),
                ('first_name', models.CharField(max_length=100)),
                ('phone_number', models.CharField(max_length=20)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='MedicalPractitioner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('specialization', models.CharField(max_length=100)),
                ('license_number', models.CharField(max_length=50)),
                ('first_name', models.CharField(max_length=100)),
                ('last_name', models.CharField(max_length=50)),
                ('country', models.CharField(max_length=50)),
                ('state', models.CharField(max_length=50)),
                ('language', models.CharField(max_length=50)),
                ('certification', models.CharField(max_length=50)),
                ('med_profile_picture', models.ImageField(blank=True, null=True, upload_to='profile_pictures/')),
                ('first_aid_certification', models.ImageField(blank=True, null=True, upload_to='profile_pictures/')),
                ('cpr_certification', models.ImageField(blank=True, null=True, upload_to='profile_pictures/')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_doctor', models.BooleanField(default=False)),
                ('phone_number', models.CharField(blank=True, max_length=20, null=True)),
                ('relationship', models.CharField(blank=True, max_length=20, null=True)),
                ('home_address', models.CharField(blank=True, max_length=100, null=True)),
                ('preferred_hospital', models.CharField(blank=True, max_length=100, null=True)),
                ('conditions', models.CharField(blank=True, max_length=100, null=True)),
                ('allergies', models.CharField(blank=True, max_length=100, null=True)),
                ('medication_name', models.CharField(blank=True, max_length=100, null=True)),
                ('medication_dosage', models.CharField(blank=True, max_length=100, null=True)),
                ('medication_start_date', models.CharField(blank=True, max_length=100, null=True)),
                ('blood_type', models.CharField(blank=True, max_length=10, null=True)),
                ('organ_donor_status', models.CharField(blank=True, max_length=100, null=True)),
                ('preferred_language', models.CharField(blank=True, max_length=10, null=True)),
                ('profile_picture', models.ImageField(blank=True, null=True, upload_to='profile_pictures/')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
