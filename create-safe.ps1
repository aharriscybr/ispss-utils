

#Import authn module
. Modules\ispss-authn.ps1

Initialize-Environment

function CreateSafe(){

    $token = Set-TokenData -tenant $tenant
    $Method = "POST"

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/json")
    $headers.Add("Authorization", "Bearer " + token)

    $body = @{
        numberOfDaysRetention: 7
        safeName = $safe
        description = "Create via Powershell Script"
    }

    $uri = "https://" + $privdomain + ".privilegecloud.cyberark.cloud/PasswordVault/API/Safes/"

    try {

        Invoke-RestMethod -Method $Method -Body $body -Uri $uri

    } catch {

        Write-Host $_

    } 

}