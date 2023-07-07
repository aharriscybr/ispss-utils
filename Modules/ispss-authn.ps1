
function Set-TokenData([PSCredential] $c, $tenant){

    $authnUrl = "https://" + $tenant + ".id.cyberark.cloud/oauth2/platformtoken"
    $method = "POST"

    $client = [System.Web.HttpUtility]::UrlEncode("")
    $type = "client_credentials"
    $secret = [System.Web.HttpUtility]::UrlEncode("")

    $body = "client_id=" + $client + "&grant_type=" + $type + "&client_secret=" + $secret

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

    $headers.Add("Content-Type", "application/x-www-form-urlencoded")

    try {

        $localToken = Invoke-RestMethod -Method $Method -Body $body -Uri $authnUrl

        return $localToken.access_token

    } catch {

        Write-Host $_

    } 

}