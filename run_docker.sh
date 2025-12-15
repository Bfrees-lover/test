#!/bin/bash

echo "=== Match3 MMORPG Docker Runner ==="

# Проверяем наличие docker
if ! command -v docker &> /dev/null; then
    echo "Ошибка: Docker не найден. Установите Docker перед запуском этого скрипта."
    exit 1
fi

# Проверяем наличие docker-compose
if ! command -v docker-compose &> /dev/null; then
    echo "Ошибка: Docker Compose не найден. Установите Docker Compose перед запуском этого скрипта."
    exit 1
fi

# Проверяем, установлен ли DISPLAY (для Linux)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -z "$DISPLAY" ]; then
        echo "ПРЕДУПРЕЖДЕНИЕ: Переменная DISPLAY не установлена."
        echo "Для корректного отображения GUI установите DISPLAY, например:"
        echo "export DISPLAY=:0"
        read -p "Продолжить без GUI? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
fi

echo "Сборка и запуск контейнера..."
docker-compose up --build