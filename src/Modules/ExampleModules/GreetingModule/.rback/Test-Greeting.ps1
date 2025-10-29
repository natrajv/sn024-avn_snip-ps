# Import the module (path to folder)
Import-Module "$PSScriptRoot\GreetingModule.psd1" -Force

# Use module functions
Write-Output (Get-Greeting -Name "Natarajan")
Write-Output (Get-TimeGreeting -Name "Natarajan")