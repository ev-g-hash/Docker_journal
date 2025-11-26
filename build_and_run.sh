#!/bin/bash

# Скрипт для сборки и запуска Docker контейнера
set -e

echo "=== Сборка Docker образа ==="
docker build -t journal-app:latest .

echo "=== Остановка существующих контейнеров ==="
docker stop journal-app 2>/dev/null || true
docker rm journal-app 2>/dev/null || true

echo "=== Запуск нового контейнера ==="
docker run -d \
    --name journal-app \
    -p 8000:8000 \
    -v $(pwd)/db.sqlite3:/app/db.sqlite3 \
    -v $(pwd)/media:/app/media \
    -e SECRET_KEY='your-production-secret-key' \
    -e DEBUG='False' \
    -e ALLOWED_HOSTS='localhost,127.0.0.1,your-domain.com' \
    journal-app:latest

echo "=== Контейнер запущен ==="
echo "Проверка статуса:"
docker ps | grep journal-app

echo "=== Логи контейнера ==="
docker logs journal-app

echo "=== Приложение доступно на http://localhost:8000 ==="