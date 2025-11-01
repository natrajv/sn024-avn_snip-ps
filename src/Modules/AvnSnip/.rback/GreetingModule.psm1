# GreetingModule.psm1
function Get-Greeting {
    param(
        [string]$Name = "World"
    )
    return "Hello, $Name!"
}

function Get-TimeGreeting {
    param(
        [string]$Name = "User"
    )
    $hour = (Get-Date).Hour
    if ($hour -lt 12) {
        $greet = "Good morning"
    } elseif ($hour -lt 18) {
        $greet = "Good afternoon"
    } else {
        $greet = "Good evening"
    }
    return "$greet, $Name!"
}

# Export only selected functions
Export-ModuleMember -Function Get-Greeting, Get-TimeGreeting
