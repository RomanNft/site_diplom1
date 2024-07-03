# Використовуємо офіційний образ PostgreSQL
FROM postgres:13

# Копіюємо скрипт ініціалізації бази даних
COPY init.sql /docker-entrypoint-initdb.d/

# Відкриваємо порт 5432
EXPOSE 5432
