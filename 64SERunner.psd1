@{
    # Module manifest for module '64SERunner'

    # Script module or binary module file associated with this manifest.
    RootModule = '64SERunner.psm1'

    # Version number of this module.
    ModuleVersion = '1.0.0'

    # Supported PSEditions
    CompatiblePSEditions = @('Desktop', 'Core')

    # ID used to uniquely identify this module
    GUID = 'e95b687a-7ed4-4c9e-bf7c-4d7d961d2f58'

    # Author of this module
    Author = 'Kalichuza'

    # Company or vendor of this module
    CompanyName = 'Kalichuza'

    # Copyright statement for this module
    Copyright = '(c) 2024 Kalichuza. All rights reserved.'

    # Description of the functionality provided by this module
    Description = '64SERunner is a PowerShell module for encoding PowerShell scripts to Base64 and running Base64-encoded scripts.'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules = @('64SE')

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module
    ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = @('Encode-ScriptToBase64', 'Run-Base64EncodedScript', 'EncodeAndRun-Script')

    # Cmdlets to export from this module
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport = @()

    # List of all modules packaged with this module
    ModuleList = @()

    # List of all files packaged with this module
    FileList = @('64SERunner.psm1', 'en-US/about_64SERunner.help.txt', 'en-US/Encode-ScriptToBase64.help.xml', 'en-US/Run-Base64EncodedScript.help.xml', 'en-US/EncodeAndRun-Script.help.xml', 'README.md')

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData = @{

        # A string containing the license for this module
        LicenseUri = 'https://www.gnu.org/licenses/gpl-3.0.txt'

        # A URL to the online help for this module
        HelpUri = 'https://github.com/kalichuza/64SERunner'

        # Release Notes of this module
        ReleaseNotes = 'Initial release of the 64SERunner module.'
    }

    # HelpInfo URI of this module
    HelpInfoUri = 'https://github.com/kalichuza/64SERunner'
}
