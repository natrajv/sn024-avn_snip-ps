function Set-CustomConfig {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ConfigName,
        
        [Parameter(Mandatory=$true)]
        [string]$ConfigValue
    )
    try {
        $isValid = Test-PrivateValidation -InputString $ConfigName
        if (-not $isValid) {
            throw "Invalid configuration name"
        }
        
        Write-Verbose "Setting config: $ConfigName = $ConfigValue"
        $timestamp = Get-InternalTimestamp
        Write-Output "[$timestamp] Config '$ConfigName' set to '$ConfigValue'"
    }
    catch {
        Write-Error $_.Exception.Message
    }
}