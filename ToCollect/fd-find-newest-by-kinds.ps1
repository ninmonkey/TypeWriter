$Error.Clear() # 2023-04-03
function __build.Main {
    $VerbosePreference = 'continue'
    $results = .\PowerShellGuide.Build.ps1 | CountOf 'buildModule'
    $VerbosePreference = 'silentlyContinue'
    return $results
}
function __get.Item.Newest {
    <#
    .NOTES
        maybe bug invoking
            __get.Item.Newest -BaseDirectory '..'
    #>
    [CmdletBinding()]
    param(
        [object]$BaseDirectory = (Get-Item 'H:\github_fork\Pwsh\PowerShellGuide'),

        [Alias('dm')]
        [ArgumentCompletions(
            '90seconds', '5minutes', '3hours', '2weeks'
        )][string]$SinceParam = '5minutes',

        # future: extension types


        [switch]$NoTypeFilter,

        [Alias('TestOnly')][switch]$WhatIf,


        [object[]]$RestRemainingArgs
    )
    $actualBaseDirectory = Get-Item -ea ignore $BaseDIrectory
    $ActualBaseDirectory ??= Get-Item 'H:\github_fork\Pwsh\PowerShellGuide'
    if(-not (Test-Path $ActualBaseDirectory)) {
        throw "BaseDirectory not found: $ActualBaseDirectory"
    }

    [ordered]@{
        BaseDir = $ActualBaseDirectory
    }
    | Format-Table -auto -Wrap | Out-String -w 1kb
    | Join-String -sep "`n" | Write-Verbose
    [Collections.Generic.List[Object]]$fdArgs = @(
        '--changed-within'
        $SinceParam
        '--one-file-system'
        # '--show-errors'
        if (-not $NoTypeFilter) {
            '-e', 'ps1'
            '-e', 'yml'
            '-e', 'json'
            '-e', 'psd1'
            '-e', 'psm1'
            '-e', 'ps1xml'
        }
        '--base-directory'
        Get-Item $BaseDirectory
        if ($RestRemainingArgs) {
            $RestRemainingArgs | Join-String -sep ', ' -op 'untested args: ' | write-warning
            $fdArgs.AddRange(@( $RestRemainingArgs ))
            # $RestRemainingArgs
        }
    )
    $fdArgs
    | Join-String -sep ' ' -f '{0}' -op 'Command: '
    | Write-Verbose -Verbose
    # wait-debugger

    [Collections.Generic.List[Object]]$Results = @(
        & fd @fdArgs
        | Get-Item
        | Sort-Object LastWriteTime -Descending
    )
    [ordered]@{
        BaseDir      = $ActualBaseDirectory
        ResultsCount = $results.count
        CommandCount = $fdArgs.Count
        CommandLine  = $fdArgs | Join-String -sep ' ' -f 'command: fd {0}'
    }
    | Format-Table -auto -Wrap | Out-String -w 1kb
    | Join-String -sep "`n" | Write-Verbose

    return $Results

}

__get.Item.Newest

Import-Module .\PowerShellGuide.psd1 -Force -Verbose

'~build~ early exit'
if($false) { return }

'~build~ export'
$results = __build.Main | CountOf '$Results'

__get.Item.Newest