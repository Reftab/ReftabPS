function Remove-Asset() {
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
        Method = 'DELETE'
    }
    
    Invoke-Reftab @Parameters
}