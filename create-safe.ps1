

#Import authn module
. .\Modules\ispss-authn.ps1
Add-Type -AssemblyName System.Web

function CreateSafe(){

    $token = Set-TokenData -tenant $tenant
    $Method = "POST"

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/json")
    $headers.Add("Authorization", $token)

    $body = @{
        numberOfDaysRetention: 0
        safeName = $safe
        description = "Create via Powershell Script"
    }

    $jsonBody = $body | ConverTo-Json

    try {

        Invoke-RestMethod -Method $Method -Body $jsonBody -Uri "https://$privdomain.privilegecloud.cyberark.cloud/PasswordVault/API/Safes" -Header $headers

    } catch {

        Write-Host $_.Exception.ResponseCode
        Write-Host $_

    } 

}

Initialize-Environment