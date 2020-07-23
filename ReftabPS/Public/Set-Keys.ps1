function Set-Keys {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Secret,
      
        [Parameter(Mandatory = $true)]
        [string]$Public
    )
    
    $commands = Get-Command -Module ReftabPS
    
    foreach($command in $commands) {
        $global:PSDefaultParameterValues["${command}:Secret"] = $Secret
        $global:PSDefaultParameterValues["${command}:Public"] = $Public
    }
}