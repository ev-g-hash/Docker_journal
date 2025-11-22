#!/bin/bash
set -e

echo "Выполнение миграций..."
python manage.py migrate --noinput

echo "Сбор статических файлов..."
python manage.py collectstatic --noinput

echo "Создание суперпользователя (если не существует)..."
python manage.py shell -c "
from django.contrib.auth.models import User;
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
    print('Суперпользователь admin/admin123 создан')
else:
    print('Суперпользователь admin уже существует')
"

echo "Запуск приложения..."
exec "$@"