function Invoke-Reftab {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Secret,
      
        [Parameter(Mandatory = $true)]
        [string]$Public,
      
        [ValidateSet("GET", "POST", "PUT", "DELETE")]
        [string]$Method = 'GET',
      
        [Parameter(Mandatory = $true)]
        [string]$Endpoint,
      
        [PSCustomObject]$Body,

        [HashTable]$SearchParameters
    )
    $uri = 'https://www.reftab.com/api/' + $Endpoint
    if ($SearchParameters) {
        $uri += '?'
        foreach($Param in $SearchParameters.keys) {
            $uri += $Param + '=' + $SearchParameters[$Param] + '&'
        }
    }
    $md5 = ''
    $contentType = ''
    if ($Body) {
        $Body = $Body | ConvertTo-JSON
        $md5Provider = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
        $utf8 = New-Object -TypeName System.Text.UTF8Encoding
        $md5 = [System.BitConverter]::ToString($md5Provider.ComputeHash($utf8.GetBytes($Body)))
        $md5 = $md5.ToLower() -replace '-', ''
        $contentType = 'application/json'
    }
    $now = Get-Date -Format 'o'
    $signatureToSign = $Method + "`n" +
        $md5 + "`n" +
        $contentType + "`n" +
        $now + "`n" +
        $uri

    $hmacsha = New-Object System.Security.Cryptography.HMACSHA256
    $hmacsha.key = [Text.Encoding]::UTF8.GetBytes($Secret)
    $signature = $hmacsha.ComputeHash([Text.Encoding]::UTF8.GetBytes($signatureToSign))
    $signature = [System.BitConverter]::ToString($signature) -replace '-', ''
    $signature = $signature.ToLower()
    $signature = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($signature))


    $headers = @{
        'Authorization' = 'RT ' + $Public + ':' + $signature
        'x-rt-date' = $now
    }
    try {
        Invoke-RestMethod -Uri $Uri -Method $Method -Body $Body -Headers $headers
    } catch {
        Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
        Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
        $streamReader = [System.IO.StreamReader]::new($_.Exception.Response.GetResponseStream())
        $ErrResp = $streamReader.ReadToEnd() | ConvertFrom-Json
        $streamReader.Close()
        Write-Host "ServerMessage:" $ErrResp.error
    }
}