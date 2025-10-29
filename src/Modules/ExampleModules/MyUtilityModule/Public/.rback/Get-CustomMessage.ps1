function Get-CustomMessage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message,
        
        [Parameter()]
        [switch]$IncludeTimestamp
    )
    begin {
        Write-Verbose "Starting Get-CustomMessage"
        $isValid = Test-PrivateValidation -InputString $Message
        if (-not $isValid) {
            throw "Invalid input provided"
        }
    }
    process {
        $result = $Message
        if ($IncludeTimestamp) {
            $timestamp = Get-InternalTimestamp
            $result = "[$timestamp] $Message"
        }
        return $result
    }
    end {
        Write-Verbose "Completed Get-CustomMessage"
    }
}