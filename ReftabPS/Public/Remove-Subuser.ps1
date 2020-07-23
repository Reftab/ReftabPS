function Remove-Subuser() {
    Param(
        [parameter(mandatory = $true)]
        [string]$UserId,
      
        [parameter(mandatory = $true)]
        [string]$Secret,
      
        [parameter(mandatory = $true)]
        [string]$Public
    )
    
    $Parameters = @{
        Secret = $secret
        Public = $public
        Endpoint = 'subusers/' + $UserId
        Method = 'DELETE'
    }
    
    Invoke-Reftab @Parameters
}