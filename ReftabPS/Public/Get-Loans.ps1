function Get-Loans() {
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
        Endpoint = 'loans'
        SearchParameters = $SearchParameters
    }
    
    Invoke-Reftab @Parameters
}
