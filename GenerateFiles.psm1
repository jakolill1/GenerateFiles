$ErrorActionPreference = "Stop"

$moduleRoot = $PSScriptRoot

# Import Private functions into MODULE SCOPE correctly
foreach ($file in Get-ChildItem "$moduleRoot\Private\*.ps1") {
    . $file.FullName
}

foreach ($file in Get-ChildItem "$moduleRoot\Public\*.ps1") {
    . $file.FullName
}

# Only export entry point
Export-ModuleMember -Function Start-GenerateFiles