function Set-Loanee() {
    Param(
        [parameter(mandatory = $true)]
        [string]$LoaneeId,
      
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
        Endpoint = 'loanees/' + $LoaneeId
    }
    
    Invoke-Reftab @Parameters
}