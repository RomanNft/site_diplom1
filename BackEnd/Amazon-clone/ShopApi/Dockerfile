# Використовуємо офіційний образ .NET SDK для збирання
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

# Встановлюємо робочу директорію
WORKDIR /src

# Копіюємо файли проекту
COPY . .

# Збираємо проект
RUN dotnet restore
RUN dotnet build -c Release -o /app/build

# Використовуємо офіційний образ .NET Runtime для запуску
FROM mcr.microsoft.com/dotnet/aspnet:5.0

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо зібрані файли
COPY --from=build /app/build .

# Відкриваємо порт 80
EXPOSE 80

# Запускаємо додаток
ENTRYPOINT ["dotnet", "ShopApi.dll"]
