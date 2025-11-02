function Get-InternalTimestamp {
    [CmdletBinding()]
    param()
    return (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
}