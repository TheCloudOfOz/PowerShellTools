using namespace System.Management.Automation.Host
function Show-Menu {
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param (
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = "Default")]
        [Parameter(Mandatory = $false, Position = 1, ParameterSetName = "Path")]
        [string]$Title,
        [Parameter(Mandatory = $true, Position = 2, ParameterSetName = "Default")][string]$Description,
        [Parameter(Mandatory = $true, Position = 3, ParameterSetName = "Default")][hashtable]$Options,
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = "Object")][hashtable]$InputObject,
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = "Path")][string]$Path
    )
    [ChoiceDescription[]]$Choices = @();
    switch ($PSCmdlet.ParameterSetName) {
        "Default" {
            foreach ($Option in $Options.GetEnumerator()) {
                $Choices += [ChoiceDescription]::new($Option.Key, $Option.Value)
            }
            return $host.ui.PromptForChoice($Title, $Description, $Choices, 0)
         }
        "Object" { 
            foreach ($Option in $InputObject.Options.GetEnumerator()) {
                $Choices += [ChoiceDescription]::new($Option.Label, $Option.Help)
            }
            return $host.ui.PromptForChoice($InputObject.Title, $InputObject.Description, $Choices, 0)
         }
        "Path" { 
            $Menu = Get-Content $Path | ConvertFrom-Json
            foreach ($Option in $Menu.Options) {
                $Choices += [ChoiceDescription]::new($Option.Label, $Option.Help)
            }
            return $host.ui.PromptForChoice($Menu.Title, $Menu.Description, $Choices, 0)
         }
        Default {}
    }  
}

$InputObject = @{
    Title = "Demo"
    Description = "Demo Desc"
    Options = @(
        @{Label = "&Red"; Help = "Red"}
        @{Label = "&Blue"; Help = "Blue"}
        @{Label = "&Yellow"; Help = "Yellow"}
    )
}

$Result = Show-Menu -Title "Demo" -Description "Demo Desc" -Options @{"&Red" = "Red"; "&Blue" = "Blue"; "&Yellow" = "Yellow"}
$Result = Show-Menu -Path .\Menu\Menu.json
$Result = Show-Menu -InputObject $InputObject


switch ($result) {
    0 { Write-Host 'You chose red.' }
    1 { Write-Host 'You chose blue.' }
    2 { Write-Host 'You chose yellow.' }
    Default { Write-Host 'You did not choose a color.' }
}
