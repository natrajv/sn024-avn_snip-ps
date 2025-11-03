function New-Snip {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, HelpMessage="Provide name of the Snip Base Directory")]
        [string]$SnipDir,

        [Parameter(Mandatory=$true, HelpMessage="Provide type of Snip (Ex. Python-1, PowerShell-1 etc.)")]
        [string]$SnipType
    )
    begin {
        Write-Verbose "Starting New-Snip for base directory '$SnipDir'"
        $Script:SnipDir = $SnipDir
    }
    process {
        switch ($SnipType) {
            "Python-1" {
                _InitializeUv
                _InitializeSupportFiles
                _InitializeJupyterKernel
                _InitializeExcel
                _ShowInstalledPackagesAndTools
                _InitializeGit
            }
            "PowerShell-1" {
                _InitializeBaseDir
            }  
            Default {
                Write-Error "Unsupported Snip Type: $SnipType. Supported types are: Python-1, PowerShell-1"
            }
        }
        #--Test
        Write-Host "Snip BaseDir: $Script:SnipDir" -ForegroundColor Cyan
        Write-Host "OneDrive BaseDir: $Script:OneDriveBaseDir" -ForegroundColor Cyan
        Write-Host "Private Dir: $PrivatePath" -ForegroundColor Cyan
        Write-Host "Public Dir: $PublicPath" -ForegroundColor Cyan
        #-----
    }
    end {
        Write-Verbose "Completed New-Snip for base directory '$SnipDir'"
    }
}