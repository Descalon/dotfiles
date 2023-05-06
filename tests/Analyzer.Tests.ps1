Describe "Analyze Module" {
    BeforeAll {
        $root = Split-Path $PSScriptRoot
        $profilePath = Join-Path -Path $root -ChildPath "profiles"
    }
    It "Should not return any violation for the rule: <Name>" -TestCases @(
        foreach($rule in (Get-ScriptAnalyzerRule -Severity @('Warning', 'Error'))){
            @{
                Name = $rule.RuleName
            }
        }
    ){
        param($Name)
        Invoke-ScriptAnalyzer -Path "$profilePath/PsExtensions.psm1" -IncludeRule $Name | Should -BeNullOrEmpty
    }

}
