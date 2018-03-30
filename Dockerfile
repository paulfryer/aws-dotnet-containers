FROM microsoft/dotnet:2.0.3-sdk AS builder
WORKDIR /sln
COPY ./DotNetExamples.sln  ./

COPY ./DotNet.WebApp/DotNet.WebApp.csproj  ./DotNet.WebApp/DotNet.WebApp.csproj
RUN dotnet restore

COPY . .
RUN dotnet build -c Release --no-restore
RUN dotnet publish "./DotNet.WebApp/DotNet.WebApp.csproj" -c Release -o "../../dist" --no-restore

FROM microsoft/aspnetcore:2.0.3
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT Local
ENTRYPOINT ["dotnet", "AspNetCoreInDocker.Web.dll"]
COPY --from=builder /sln/dist .