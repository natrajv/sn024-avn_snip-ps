function New-Snip {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$SnipDir
    )
    begin {
        Write-Verbose "Starting New-Snip for base directory '$SnipDir'"
        $Script:SnipDir = $SnipDir
    }
    process {
        _InitializeUv
        _InitializeSupportFiles
        _InitializeJupyterKernel
        _InitializeExcel
        _ShowInstalledPackagesAndTools
        _InitializeGit
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