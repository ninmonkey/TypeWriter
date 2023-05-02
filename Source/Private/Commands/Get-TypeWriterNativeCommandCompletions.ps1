function Get-TypeWriterNativeCommandCompletions {
    <#
    .SYNOPSIS
        lists native commands that are registered for possible completions
    .DESCRIPTION
    .EXAMPLE
    #>
    [Alias(
        'TypeWriter.GetNativeCompletions'
    )]
    [CmdletBinding(DefaultParameterSetName = 'PSCommand')]
    param ()


    if ($true) {
        'future will enumerate declared completers, for now GCI' | Write-Warning
        # Push-Location $PSScriptRoot -stack 'get-native'
        # wait this won't work as it executes from other paths
        # Get-ChildItem '../Completer' *.ps1 | Sort-Object name
        Get-ChildItem 'H:/data/2023/pwsh/PsModules/TypeWriter/Source/Private/Completer' *.ps1
        | Sort-Object name
        # Pop-Location -stack 'get-native'
    }
}
