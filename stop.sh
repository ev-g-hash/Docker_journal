#!/bin/bash

# Скрипт для остановки контейнера
echo "=== Остановка контейнера journal-app ==="
docker stop journal-app 2>/dev/null || echo "Контейнер не найден или уже остановлен"

echo "=== Удаление контейнера ==="
docker rm journal-app 2>/dev/null || echo "Контейнер не найден или уже удален"

echo "=== Контейнер остановлен и удален ==="