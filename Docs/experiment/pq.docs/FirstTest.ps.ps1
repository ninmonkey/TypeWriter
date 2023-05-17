Import-Module Pipescript -ea stop
if ( -not (Get-Command -ea 'ignore')) {
    Write-Warning 'explicitly dot sourcing in this test'
    . 'H:\data\2023\pwsh\PsModules\TypeWriter\Source\Private\Completer\powerquery-vscode.ps1'
}

$Paths = @{
    AppRoot    = $PSScriptRoot
    ExportBase = Join-Path $PSScriptRoot 'docs'
}
$getCommandSplat = @{
    CommandType = 'Application'
    ErrorAction = 'stop'
    Name        = 'H:/data/2023/pwsh/PsModules/TypeWriter/Docs/experiment/maybe-pq-docs.ps.md'
}
$Bin = Get-Command @getCommandSplat

Goto $Paths.AppRoot

function ExportHelp.Get-PqTestCommand {

    [Outfile]
    param()
    'hi world'
    '<b>'
    "done.`ndone2"
}

ExportHelp.Get-PqTestCommand

