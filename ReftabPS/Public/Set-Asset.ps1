function Set-Asset() {
    Param(
        [parameter(mandatory = $true)]
        [string]$AssetId,
      
        [parameter(mandatory = $true)]
        [PSCustomObject]$Body,
      
        [parameter(mandatory = $true)]
        [string]$Secret,
      
        [parameter(mandatory = $true)]
        [string]$Public
    )
    
    $Parameters = @{
        Secret = $secret
        Public = $public
        Method = 'PUT'
        Body = $Body
        Endpoint = 'assets/' + $AssetId
    }
    
    Invoke-Reftab @Parameters
}