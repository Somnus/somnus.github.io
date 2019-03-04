FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0 AS build
WORKDIR /src
COPY ["Framework.Website.API/Framework.Website.API.csproj", "Framework.Website.API/"]
COPY ["Framework.NetCore/Framework.NetCore.csproj", "Framework.NetCore/"]
COPY ["Framework.Website.Repositories/Framework.Website.Repositories.csproj", "Framework.Website.Repositories/"]
COPY ["Framework.Website.Models/Framework.Website.Models.csproj", "Framework.Website.Models/"]
COPY ["Framework.Website.IRepositories/Framework.Website.IRepositories.csproj", "Framework.Website.IRepositories/"]
COPY ["Framework.Website.Common/Framework.Website.Common.csproj", "Framework.Website.Common/"]
COPY ["Framework.Data.Service/Framework.Data.Service.csproj", "Framework.Data.Service/"]
RUN dotnet restore "Framework.Website.API/Framework.Website.API.csproj"
COPY . .
WORKDIR "/src/Framework.Website.API"
RUN dotnet build "Framework.Website.API.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Framework.Website.API.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Framework.Website.API.dll"]