#!/usr/bin/env bash
set -e
# Install dependencies (vercel may already install, but ensure collectstatic can run)
python -m pip install -r requirements.txt
# Collect static files to the directory expected by vercel.json ("static")
python manage.py collectstatic --noinput
