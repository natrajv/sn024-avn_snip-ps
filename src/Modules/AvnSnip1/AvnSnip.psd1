@{
    # Required - Module version
    ModuleVersion = '1.0.0'

    # Script module (the .psm1 file)
    RootModule = 'AvnSnip.psm1'

    # Author/Description
    Author = 'Natarajan'
    Description = 'Initialize New Snip for Python'

    # Functions to export (optional, can also be in Export-ModuleMember)
    FunctionsToExport = @('New-Snip')

    # No Cmdlets, Aliases exported
    CmdletsToExport = @()
    AliasesToExport = @()

    # Optional GUID (unique identifier)
    GUID = 'f3007b04-e5b6-4138-83fb-c9c8f979066b'
}
