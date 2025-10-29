function Test-PrivateValidation {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$InputString
    )
    try {
        if ([string]::IsNullOrEmpty($InputString)) {
            throw "Input string cannot be empty"
        }
        Write-Verbose "Validation passed for input: $InputString"
        return $true
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
}