web: gunicorn --bind 0.0.0.0:$PORT --workers 3 --worker-class sync --timeout 120 --max-requests 1000 --max-requests-jitter 100 project.wsgi:application
release: python manage.py migrate --noinput