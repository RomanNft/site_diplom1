# Start with the SDK image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the entire solution and restore dependencies
COPY . .

# Restore packages
RUN dotnet restore "ShopApi/ShopApi.csproj"

# Install the dotnet-ef tool locally
RUN dotnet tool install -g dotnet-ef --version 6.0

# Set PATH environment variable to include dotnet tools
ENV PATH="${PATH}:/root/.dotnet/tools"

# Build and update database (consider using a separate initialization step for DB)
RUN dotnet build "ShopApi/ShopApi.csproj" -c Release -o /app/build

# Specify the final image for publish
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final
WORKDIR /app

# Copy published application from build stage
COPY --from=build /app/build .

# Expose port
EXPOSE 5034

# Set the entry point
ENTRYPOINT ["dotnet", "ShopApi.dll", "--urls", "http://0.0.0.0:5034"]
