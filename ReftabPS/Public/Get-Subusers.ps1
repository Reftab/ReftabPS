function Get-Subusers() {
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
        Endpoint = 'subusers'
        SearchParameters = $SearchParameters
    }
    
    Invoke-Reftab @Parameters
}