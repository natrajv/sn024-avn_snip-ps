# MyUtilityModule.psd1
@{
    ModuleVersion = '1.0.0'
    GUID = '1eae510a-093e-4922-812f-a75f9aa2461e' # Generate a unique GUID
    Author = 'Your Name'
    CompanyName = 'Your Company'
    Copyright = '(c) 2025 Your Name. All rights reserved.'
    Description = 'A sample PowerShell module with public, private, and test functions in separate folders'
    PowerShellVersion = '5.1'
    RootModule = 'MyUtilityModule.psm1'
    FunctionsToExport = @('Get-CustomMessage', 'Set-CustomConfig')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
}