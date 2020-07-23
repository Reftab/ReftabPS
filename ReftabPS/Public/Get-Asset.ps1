function Get-Asset() {
    Param(
        [parameter(mandatory = $true)]
        [string]$AssetId,
      
        [parameter(mandatory = $true)]
        [string]$Secret,
      
        [parameter(mandatory = $true)]
        [string]$Public
    )
    
    $Parameters = @{
        Secret = $secret
        Public = $public
        Endpoint = 'assets/' + $AssetId
    }
    
    Invoke-Reftab @Parameters
}