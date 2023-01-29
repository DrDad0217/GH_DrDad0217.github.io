Starting in `Powershell 7.1`  you can override splatted parameters.

if you know the positions of the paramaters you can set your values in the position order without having to supply a key-value pair, just the value

```powershell
$Params = (

'/home/poshdad/Desktop/text.txt'
'/home/poshdad/Desktop/ChristmasPuzzle'

)

Copy-Item @Params
```
Example showing named and unnamed parameters being passed.

```powershell
Function Test-Function {
  Param(
    $Param1,
    $Param2
  
    )
  Write-Host "Unnamed Parameters" -ForegroundColor 'Green'
  $Args

  Write-Host "Bound Parameters" -ForegroundColor 'Green'
  $PSBoundParameters
    
    Test-Function "test1" "test2" "test3" -Param1 "testParam" -Param2  "testParam2"
}
```
Example showing a custom wrapper function that accepts both named and unnamed parameters 

```powershell

Function Copy-CustomItem {
  Get-ChildItem

  Copy-Item @Args @PSBoundParameters

  Get-ChildItem
}

```
[JeffBrownArticle](https://jeffbrown.tech/powershell-splatting/)

Parameters

```powershell
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $StorageAccountName,
    [Parameter(Mandatory)]
    [string]
    $ResourceGroup,
    [Parameter(Mandatory)]
    [ValidateSet("Dev", "Test", "Prod")]
    [string]
    $Environment
)
```
Jeff sets the parameters in a hashtable that will be changed depending on the value coming from the environment variable.

```powershell

$stgAcctArgs = @{
    "AccountName" = $StorageAccountName
    "ResourceGroupName" = $ResourceGroup
    "Location" = $null
    "SkuName" = $null
}
```
Jeff sets up a switch which changes the parameters depending on the environment variable.


```powershell
switch ($Environment) {
    "Dev" { 
        $stgAcctArgs.AccountName += "dev"
        $stgAcctArgs.Location = "westus"
        $stgAcctArgs.SkuName = "Standard_LRS"
        break
    }
     
    "Test" { 
        $stgAcctArgs.AccountName += "test"
        $stgAcctArgs.Location = "eastus"
        $stgAcctArgs.SkuName = "Standard_LRS"
        break
    }
    "Prod" { 
        $stgAcctArgs.AccountName += "prod"
        $stgAcctArgs.Location = "southcentralus"
        $stgAcctArgs.SkuName = "Premium_LRS"
        $stgAcctArgs.EnableHttpsTrafficOnly = $true
        $stgAcctArgs.MinimumTlsVersion = "TLS1_2"
        break
    }
}
New-AzStorageAccount @stgAcctArgs
```

#PSBoundParameters

function Get-PSBoundParameters {
    [cmdletbinding()]
    param(
        [Parameter(

        )]
        [string]
        $ParamOne,

        [Parameter(

        )]
        [string]
        $ParamTwo
    )

    begin {
        
        if($Null -ne $Psboundparameters.paramtwo){

        Write-host $PSboundparameters.paramtwo
        }
    }

    process {
        
    }

    end {

        return $PSBoundParameters

    }
}