If(-Not(Get-Module -Name 'PSScriptAnalyzer' -ListAvailable)){
    Install-Module -Name 'PSScriptAnalyzer' -Force
}
If(-Not(Get-Module -Name 'Pester' -ListAvailable)) {
    Install-Module -Name 'Pester' -Force
}
Import-Module Pester
$root = $PSScriptRoot
$resultsDir = "$root/test-results"
if(-not (Test-Path -Path $resultsDir)){
    New-item -ItemType Directory -Path $resultsDir | Out-Null
}
$config = [PesterConfiguration]::Default
$config.Run.Path = "$root/tests"
$config.Run.PassThru = $true
$config.Output.Verbosity = 'None'
$config.TestResult = @{
    Enabled = $true
    OutputFormat = 'JUnitXML'
    OutputPath = "$resultsDir/testResults.xml"
}
$config.Should.ErrorAction = 'Continue'

$result = Invoke-Pester -Configuration $config

if($result.Result -eq 'Failed') {
    throw "$($result.FailedCount) rule(s) violated"
}