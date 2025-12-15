@echo off
echo === Match3 MMORPG Docker Runner for Windows ===

REM Проверяем наличие docker
docker --version >nul 2>&1
if errorlevel 1 (
    echo Ошибка: Docker не найден. Установите Docker Desktop для Windows перед запуском этого скрипта.
    pause
    exit /b 1
)

REM Проверяем наличие docker-compose
docker-compose --version >nul 2>&1
if errorlevel 1 (
    echo Ошибка: Docker Compose не найден. Установите Docker Compose перед запуском этого скрипта.
    pause
    exit /b 1
)

echo Сборка и запуск контейнера...

REM Для Windows с WSL2 нужно указать правильный путь к X-серверу
if defined DISPLAY (
    docker-compose up --build
) else (
    echo Предупреждение: Переменная DISPLAY не установлена.
    echo Для корректного отображения GUI установите X-Server (например, VcXsrv) и экспортируйте DISPLAY.
    set /p CONTINUE=Продолжить без GUI? (y/N): 
    if /i "%CONTINUE%"=="y" (
        docker-compose up --build
    ) else (
        exit /b 1
    )
)