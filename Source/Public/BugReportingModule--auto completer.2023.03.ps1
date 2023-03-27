# next
# param x will run the completer

throw 'left off, in session

run
    export-Pipescript
        add breakpoint to file












'

function bug.Modules.ListAvailable {
    # basics , no caching
    Get-Module PipeScript, PipeWorks -list -All
    | Sort-Object
}


function bug.Modules.Uninstall {
    # basics, just remove every instance
    bug.Modules.ListAvailable
    | CountOf -l 'found instance'
    | Uninstall-Module -Verbose
    | CountOf -l 'removed instance'

}
function bug.Modules.Install {
    # basics with some completions
    [CmdletBinding()]
    param(
        # name to install
        [ArgumentCompletions('Pipeworks', 'Pipescript')]
        [parameter(Mandatory, Position = 0)]
        [string]$ModuleName,

        [ArgumentCompletions( # future: should use remote call to autocomplete valid
            '1.2.1',
            '1.2.2',
            '1.2.3',
            '1.9.9.4'

        )]
        [version]$MaxVersion,

        # always force?
        [Alias('AlwaysForce')]
        [switch]$Force,
        [switch]$WithoutVerbose
    )
    $installModuleSplat = @{
        Name           = $ModuleName
        MaximumVersion = $MaxVersion
        Force          = $Force ?? $false
        Verbose        = -not $WithoutVerbose
    }

    $installModuleSplat | json -depth 2 | Join-String -op 'invoke => Bug.Modules.Install =  ' | Write-Verbose -Verbose
    Install-Module @installModuleSplat
    # Install-Module -Name pipescript -MaximumVersion '1.2.2'
    Install-Module -Name pipeworks -MaximumVersion '1.9.9.4' -Force -AllowClobber

}
# Remove-Module pipescript, pipeworks -ea ignore
bug.Modules.ListAvailable
| Format-Table -auto
Push-Location -stack 'test' 'H:\data\2023\BI\git\ninMonkQuery-examples\'
# Pop-Location -stack 'test'

'try: '
@(
    Get-Command bug.* | Sort-Object name | Format-Table -auto
)

# ($allmods = Get-Module PipeScript, PipeWorks -list -All ) | Sort-Object | Format-Table -auto