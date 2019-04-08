$fabrikamCerts = Get-ChildItem -Path cert: -Recurse | Where-Object {
    $_ -is [System.Security.Cryptography.X509Certificates.X509Certificate2] -and $_.Issuer -like '*fabrikam*'
} 

if (-not $fabrikamCerts) {
    Write-Host "Add self signed certificate"
    New-SelfSignedCertificate -DnsName "www.fabrikam.com", "www.contoso.com" -CertStoreLocation "cert:\LocalMachine\My"
}