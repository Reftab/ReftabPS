function Set-Subuser() {
    Param(
        [parameter(mandatory = $true)]
        [string]$UserId,
      
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
        Endpoint = 'subusers/' + $UserId
    }
    
    Invoke-Reftab @Parameters
}