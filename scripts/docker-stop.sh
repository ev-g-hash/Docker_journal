#!/bin/bash

echo "Остановка и удаление контейнеров..."
docker-compose down

echo "Удаление томов (осторожно! Это удалит все данные)..."
read -p "Вы уверены, что хотите удалить все данные? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    docker-compose down -v
    echo "Все контейнеры и тома удалены."
else
    echo "Только контейнеры остановлены."
fi