ReftabPS
=============

This is a quick and dirty module to interact with the Reftab API via PowerShell.

# Instructions

```powershell
# One time setup
  # Download repository
  # Extract the ReftabPS folder to a module path (e.g. $env:USERPROFILE\Documents\WindowsPowerShell\Modules\)

#Import the module
Import-Module ReftabPS

# Get commands in the module
Get-Command -Module ReftabPS
```

### Prerequisites

* PowerShell 5 or later
* A valid API key pair from Reftab
  * Generate one in Reftab Settings
  
# Examples

### Get an Asset and Update It

```powershell
#This example shows how to get an asset and update it

#First enter your API key information
Set-Keys -Secret <string> -Public <string>

#Retrieve an asset
$asset = Get-Asset -AssetId <string>

#Change a field within the details object
$asset.details."Serial No." = "ABC-123"

#Save Asset to Reftab
Set-Asset -AssetId <string> -Body $asset
```