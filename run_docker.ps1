Write-Host "=== Match3 MMORPG Docker Runner for Windows ===" -ForegroundColor Green

# Проверяем наличие docker
try {
    docker --version | Out-Null
    Write-Host "Docker найден" -ForegroundColor Green
} catch {
    Write-Host "Ошибка: Docker не найден. Установите Docker Desktop для Windows перед запуском этого скрипта." -ForegroundColor Red
    Read-Host "Нажмите Enter для выхода"
    exit 1
}

# Проверяем наличие docker-compose
try {
    docker-compose --version | Out-Null
    Write-Host "Docker Compose найден" -ForegroundColor Green
} catch {
    Write-Host "Ошибка: Docker Compose не найден. Установите Docker Compose перед запуском этого скрипта." -ForegroundColor Red
    Read-Host "Нажмите Enter для выхода"
    exit 1
}

Write-Host "Сборка и запуск контейнера..." -ForegroundColor Yellow

# Проверяем, установлен ли DISPLAY
if (Test-Path env:DISPLAY) {
    Write-Host "Переменная DISPLAY установлена: $env:DISPLAY" -ForegroundColor Green
    docker-compose up --build
} else {
    Write-Host "Предупреждение: Переменная DISPLAY не установлена." -ForegroundColor Yellow
    Write-Host "Для корректного отображения GUI установите X-Server (например, VcXsrv) и экспортируйте DISPLAY." -ForegroundColor Yellow
    
    $continue = Read-Host "Продолжить без GUI? (y/N)"
    if ($continue -eq 'y' -or $continue -eq 'Y') {
        $env:DISPLAY = "host.docker.internal:0"
        Write-Host "Установлена переменная DISPLAY: $env:DISPLAY" -ForegroundColor Green
        docker-compose up --build
    } else {
        exit 1
    }
}