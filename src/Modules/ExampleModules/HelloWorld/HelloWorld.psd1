# HelloWorld.psd1
@{
    ModuleVersion = '1.0.0'
    GUID = 'e9eb4798-c7a5-4447-bd94-8d9ad224f66a' # Generate a unique GUID
    Author = 'Your Name'
    CompanyName = 'Your Company'
    Copyright = '(c) 2025 Your Name. All rights reserved.'
    Description = 'A sample PowerShell module with public, private, and test functions in separate folders'
    PowerShellVersion = '5.1'
    RootModule = 'HelloWorld.psm1'
    FunctionsToExport = @('Get-Msg')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
}