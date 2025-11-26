import os
from django.core.wsgi import get_wsgi_application

# Используем стандартный settings.py
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings')

application = get_wsgi_application()