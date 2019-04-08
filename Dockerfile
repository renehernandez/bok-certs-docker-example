FROM mcr.microsoft.com/windows/servercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR C:/example

COPY . .

RUN ./importer.ps1

CMD ./listCertificates.ps1