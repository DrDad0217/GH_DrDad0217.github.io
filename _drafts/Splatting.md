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