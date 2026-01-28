Docker + Nginx + PHP (тестовое задание)

Минимальный стек: Nginx (обратный прокси) + PHP-FPM в Docker.

Запуск
```bash
docker compose build
docker compose up -d
```
Приложение доступно по адресу **http://localhost:8080** — отображается `phpinfo()` и установленные расширения: `pdo_mysql`, `pdo_firebird`, `redis`.

Структура проекта

docker-compose.yml   # nginx + php-fpm, сеть, тома
nginx/
    default.conf    # виртуальный хост, прокси .php на php-fpm
php/
    Dockerfile      # php:8.4-fpm, pdo_mysql, pdo_firebird, redis
 public/
    index.php       # phpinfo()
README.md

