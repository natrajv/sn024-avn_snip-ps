# AvnSnip.psm1

#--OneDrive Base Directory Path
$Script:OneDriveBaseDir = $env:OD_HOME
#--Snip Directory Name
$Script:SnipDir = "xtest" #Default Snip Directory

#--- Load required private scripts
$PublicPath = Join-Path -Path $PSScriptRoot -ChildPath "Public"
$PrivatePath = Join-Path -Path $PSScriptRoot -ChildPath "Private"

#--- Load public functions
. "$PrivatePath\_InitSnip.ps1"

#--- Load public functions
. "$PublicPath\New-Snip.ps1"

# Export only selected functions
Export-ModuleMember -Function New-Snip