function New-Loan() {
    Param(      
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
        Method = 'POST'
        Body = $Body
        Endpoint = 'loans'
    }
    
    Invoke-Reftab @Parameters
}
