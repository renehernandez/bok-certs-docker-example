Get-ChildItem -Path cert: -Recurse | Where-Object {
        $_ -is [System.Security.Cryptography.X509Certificates.X509Certificate2] -and $_.Issuer -like '*fabrikam*'
    } 