function Get-Assets() {
    Param( 
        [parameter(mandatory = $true)]
        [string]$secret,
      
        [parameter(mandatory = $true)]
        [string]$public,

        [HashTable]$SearchParameters
    )
    
    $Parameters = @{
        Secret = $secret
        Public = $public
        Endpoint = 'assets'
        SearchParameters = $SearchParameters
    }
    
    Invoke-Reftab @Parameters
}