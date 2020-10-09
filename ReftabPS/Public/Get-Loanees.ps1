function Get-Loanees() {
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
        Endpoint = 'loanees'
        SearchParameters = $SearchParameters
    }
    
    Invoke-Reftab @Parameters
}