# Makefile для управления проектом Match3 MMORPG

# Сборка Docker-образа
build:
	docker-compose build

# Запуск приложения в Docker
run: build
	docker-compose up

# Запуск приложения в detached режиме
start: build
	docker-compose up -d

# Остановка приложения
stop:
	docker-compose down

# Перезапуск приложения
restart: stop start

# Просмотр логов
logs:
	docker-compose logs -f

# Удаление контейнеров и образов
clean:
	docker-compose down --rmi all --remove-orphans
	docker system prune -f

# Интерактивная консоль в контейнере
shell:
	docker-compose exec match3-app bash

# Удаление базы данных
reset-db:
	rm -f ./match3.db

# Полный сброс и пересоздание
fresh-start: reset-db clean start

.PHONY: build run start stop restart logs clean shell reset-db fresh-start