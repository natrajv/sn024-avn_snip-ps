# Test-Greeting.ps1

# Import the module (path to folder)
Import-Module "$PSScriptRoot\GreetingModule.psd1" -Force

# Use module functions
Write-Output (Get-Greeting -Name "Natarajan")
Write-Output (Get-TimeGreeting -Name "Natarajan")

# Optionally, check loaded modules
Get-Module GreetingModule
