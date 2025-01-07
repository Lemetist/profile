FROM python:3.13-slim

# Установите рабочую директорию
WORKDIR /app

# Копирование и установка зависимостей
COPY requirements.txt .
RUN pip install -r requirements.txt

# Копирование приложения в контейнер
COPY . .

# Запуск приложения с SSL сертификатами
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "443", "--ssl-keyfile", "/etc/letsencrypt/live/lemetist.me/privkey.pem", "--ssl-certfile", "/etc/letsencrypt/live/lemetist.me/fullchain.pem"]

