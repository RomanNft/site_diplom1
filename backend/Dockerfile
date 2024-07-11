FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["BackEnd/Amazon-clone/ShopApi/ShopApi.csproj", "BackEnd/Amazon-clone/ShopApi/"]
RUN dotnet restore "BackEnd/Amazon-clone/ShopApi/ShopApi.csproj"
COPY . .
WORKDIR "/src/BackEnd/Amazon-clone/ShopApi"
RUN dotnet build "ShopApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ShopApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ShopApi.dll"]
