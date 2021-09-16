using namespace System.Management.Automation.Host

# $red = New-Object System.Management.Automation.Host.ChoiceDescription '&Red', 'Favorite color: Red'
# $blue = New-Object System.Management.Automation.Host.ChoiceDescription '&Blue', 'Favorite color: Blue'
# $yellow = New-Object System.Management.Automation.Host.ChoiceDescription '&Yellow', 'Favorite color: Yellow'

$red = [ChoiceDescription]::new('&Red', 'Favorite color: Red')
$blue = [ChoiceDescription]::new('&Blue', 'Favorite color: Blue')
$yellow = [ChoiceDescription]::new('&Yellow', 'Favorite color: Yellow')
$options = [ChoiceDescription[]]($red, $blue, $yellow)

$title = 'Favorite color'
$message = 'What is your favorite color?'
$result = $host.ui.PromptForChoice($title, $message, $options, 0)

switch ($result) {
    0 {  }
    1 {  }
    2 {  }
    Default {}
}