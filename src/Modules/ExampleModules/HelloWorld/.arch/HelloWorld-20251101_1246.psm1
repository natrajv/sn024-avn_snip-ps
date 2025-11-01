#--- Load required private scripts
$publicPath = Join-Path -Path $PSScriptRoot -ChildPath "public"
$privatePath = Join-Path -Path $PSScriptRoot -ChildPath "private"
#---
. "$privatePath\_InitializeConfig.ps1"
. "$privatePath\_GetMsg.ps1"

#--- Load public functions
. "$publicPath\Get-Msg.ps1"

#--- Export public functions
Export-ModuleMember -Function Get-Msg