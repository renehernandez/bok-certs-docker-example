$certificatesPath = Join-Path -Path $PSScriptRoot -ChildPath 'Certs'
New-Item -Path $certificatesPath -ItemType Directory -Force | Out-Null
Get-ChildItem -Path $certificatesPath | Remove-Item -Force

Get-ChildItem -Path cert: -Recurse | Where-Object { 
        $_ -is [System.Security.Cryptography.X509Certificates.X509Certificate2] -and $_.Issuer -like '*fabrikam*' 
    } | ForEach-Object { 
        $certPath = Join-Path $certificatesPath -ChildPath "cert_$($_.Thumbprint).cer"
        Export-Certificate -Cert $_ -FilePath $certPath -Force | Out-Null
}