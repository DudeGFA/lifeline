#!/usr/bin/env bash
# exit on error
set -o errexit

# sudo apt-get install libasound-dev

pip install -r requirements.txt

# python manage.py collectstatic --no-input
python manage.py makemigrations
python manage.py migrate