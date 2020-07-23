function Get-Loanee() {
    Param(
        [parameter(mandatory = $true)]
        [string]$LoaneeId,
      
        [parameter(mandatory = $true)]
        [string]$Secret,
      
        [parameter(mandatory = $true)]
        [string]$Public
    )
    
    $Parameters = @{
        Secret = $secret
        Public = $public
        Endpoint = 'loanees/' + $LoaneeId
    }
    
    Invoke-Reftab @Parameters
}