# Use the official SQL Server image from Microsoft
FROM mcr.microsoft.com/mssql/server:latest

# Set the environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=YourStrong@Passw0rd

# Expose the SQL Server port
EXPOSE 1433

# Run SQL Server when the container starts
CMD ["/opt/mssql/bin/sqlservr"]