@{
    # Required - Module version
    ModuleVersion = '1.0.0'

    # Script module (the .psm1 file)
    RootModule = 'GreetingModule.psm1'

    # Author/Description
    Author = 'Natarajan'
    Description = 'A simple PowerShell greeting module example'

    # Functions to export (optional, can also be in Export-ModuleMember)
    FunctionsToExport = @('Get-Greeting', 'Get-TimeGreeting')

    # No Cmdlets, Aliases exported
    CmdletsToExport = @()
    AliasesToExport = @()

    # Optional GUID (unique identifier)
    GUID = 'b5b32a9e-0b9b-42c0-b5e5-f1b12e5b9ef1'
}