# Використовуємо офіційний образ Node.js
FROM node:14 as build

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо package.json та package-lock.json
COPY package*.json ./

# Встановлюємо залежності
RUN npm install

# Копіюємо решту файлів проекту
COPY . .

# Будуємо проект
RUN npm run build

# Використовуємо офіційний образ Nginx для розміщення згенерованого контенту
FROM nginx:alpine

# Копіюємо згенерований контент в директорію Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Копіюємо конфігураційний файл Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Відкриваємо порт 80
EXPOSE 80

# Запускаємо Nginx
CMD ["nginx", "-g", "daemon off;"]
