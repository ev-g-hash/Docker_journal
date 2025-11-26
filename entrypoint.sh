#!/bin/bash
set -e

# Ожидание базы данных (для SQLite это не нужно, но оставим для совместимости)
echo "Waiting for database..."

# Применяем миграции
echo "Applying migrations..."
python manage.py migrate --noinput

# Создает суперпользователя если его нет (опционально)
echo "Creating superuser if needed..."
python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(is_superuser=True).exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
    print('Superuser created: admin/admin123')
"

# Собираем статические файлы
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Запускаем приложение
echo "Starting application..."
exec "$@"