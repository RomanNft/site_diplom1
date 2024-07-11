# Dockerfile for building a single container with backend, frontend, and database

# Base image for backend
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS backend

WORKDIR /app/backend
COPY BackEnd/Amazon-clone .

# Base image for frontend
FROM node:20-alpine AS frontend

WORKDIR /app/frontend
COPY FrontEnd/my-app .

# Base image for database
FROM mcr.microsoft.com/mssql/server:latest AS database

# You can copy your database scripts or setup here if needed

# Final image combining backend, frontend, and database
FROM alpine:latest

WORKDIR /app
COPY --from=backend /app/backend .
COPY --from=frontend /app/frontend .
COPY --from=database /app/database .

# Example: Expose ports if needed
EXPOSE 80

# Example: Start command if needed
CMD ["sh", "-c", "your_start_commands_here"]
