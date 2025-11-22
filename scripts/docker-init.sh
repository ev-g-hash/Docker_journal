#!/bin/bash

echo "=== Инициализация Django проекта в Docker ==="

# Остановка контейнеров
echo "Остановка контейнеров..."
docker-compose down

# Сборка образов
echo "Сборка Docker образов..."
docker-compose build

# Запуск контейнеров
echo "Запуск контейнеров..."
docker-compose up -d

# Ожидание готовности базы данных
echo "Ожидание готовности базы данных..."
sleep 10

# Выполнение миграций
echo "Выполнение миграций..."
docker-compose exec web python manage.py makemigrations
docker-compose exec web python manage.py migrate

# Создание суперпользователя
echo "Создание суперпользователя..."
docker-compose exec web python manage.py createsuperuser --username admin --email admin@example.com --noinput || echo "Суперпользователь уже существует"

# Сборка статических файлов
echo "Сборка статических файлов..."
docker-compose exec web python manage.py collectstatic --noinput

echo "=== Инициализация завершена! ==="
echo "Приложение доступно по адресу: http://localhost:8000"
echo "Панель администратора: http://localhost:8000/admin/"
echo "Логин: admin, Пароль: admin123 (или ваш пароль при создании)"