$certificatesPath = Join-Path -Path $PSScriptRoot -ChildPath 'Certs'

Get-ChildItem -Path $certificatesPath -Filter *.cer | ForEach-Object {
    Import-Certificate -FilePath $_.FullName -CertStoreLocation Cert:\LocalMachine\Root\ | Out-Null
}