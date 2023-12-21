function Set-Loanee() {
    Param(
        [parameter(mandatory = $true)]
        [string]$LoanId,
      
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
        Endpoint = 'loans/' + $LoanId
    }
    
    Invoke-Reftab @Parameters
}