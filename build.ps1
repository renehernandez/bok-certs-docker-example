# generate self signed certificate
& ./generateSelfCertificate.ps1

# exporting the Certificates
& ./exporter.ps1

# build docker image
docker build -t certs-example $PSScriptRoot