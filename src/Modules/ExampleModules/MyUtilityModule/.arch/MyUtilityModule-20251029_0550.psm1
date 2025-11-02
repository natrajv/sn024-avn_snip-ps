# MyUtilityModule.psm1 [01]
#--
# Example: Powershell example code for module with public, private and helper functions
#-----#

# Define paths for Public, Private, and Tests folders
$publicPath = Join-Path -Path $PSScriptRoot -ChildPath "Public"
$privatePath = Join-Path -Path $PSScriptRoot -ChildPath "Private"
$testsPath = Join-Path -Path $PSScriptRoot -ChildPath "Tests"

# Import Private functions
Get-ChildItem -Path $privatePath -Filter *.ps1 -ErrorAction SilentlyContinue | ForEach-Object {
    . $_.FullName
}

# Import Test functions
Get-ChildItem -Path $testsPath -Filter *.ps1 -ErrorAction SilentlyContinue | ForEach-Object {
    . $_.FullName
}

# Import Public functions
Get-ChildItem -Path $publicPath -Filter *.ps1 -ErrorAction SilentlyContinue | ForEach-Object {
    . $_.FullName
}

# Export only public functions
$publicFunctions = Get-ChildItem -Path $publicPath -Filter *.ps1 -ErrorAction SilentlyContinue | ForEach-Object {
    $_.BaseName
}
Export-ModuleMember -Function $publicFunctions

<#
**==References==**
[01] "Powershell example code for module with public, private and helper functions", Grok, https://grok.com/share/bGVnYWN5_0a7586a1-f1db-412f-838c-81244ca93678, 28 Oct 2025.
#>