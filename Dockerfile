# Используем официальный образ Python 3.11.5
FROM python:3.11.5-slim

# Устанавливаем необходимые системные зависимости для pygame и GUI
RUN apt-get update && apt-get install -y \
    libgtk-3-dev \
    libglib2.0-dev \
    libxext-dev \
    libxrender-dev \
    libxrandr-dev \
    libxss-dev \
    libgconf-2-4 \
    libasound2-dev \
    libpulse-dev \
    libxcb-shm0-dev \
    libxcb-render-util0-dev \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы зависимостей
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта
COPY . .

# Делаем скрипт запуска исполняемым
RUN chmod +x /app/start_game.sh

# Открываем порт (если нужно будет подключаться к веб-интерфейсу)
EXPOSE 8000

# Команда для запуска приложения
CMD ["./start_game.sh"]