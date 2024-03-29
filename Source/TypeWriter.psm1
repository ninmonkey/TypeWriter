$script:______originalRootPath = gi .

$__buildCfg = @{
    LoadTypeAndFormatdata = $false
    LooseFunctionImports  = $true
}
$script:__moduleInfo = @{
    Files = [Collections.Generic.List[Object]]::new()
}
$script:__twAlwaysBreakInCompleterState = $false
class newModuleEvent {
    [string]$Label
    [object]$Data
}
function newEventRecord {
    # not literal events
    [OutputTYpe('newModuleEvent')]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string]$Label,

        [Parameter(Mandatory, Position = 1)]
        [object]$Data
    )

    return [newModuleEvent]@{
        Label = $Label
        $Data = $Data
    }
}


#region SourceInit
#Dot source the files
[Collections.Generic.List[Object]]$HardcodedToExportFunc = @(
    # 'coerce.ToFileInfo'
    # 'Get-RandomExcelAntColor'
    # 'xl.Errors.Inspect'
    #

    'Log-TypeWriterNativeArgumentCompleterState' # 'Log-TypeWriterNativeArgumentCompleterState' = { 'tw.Log.NativeArgumentCompleterState' }
    'Log-TypeWriterArgumentCompleterState' # 'Log-TypeWriterArgumentCompleterState' = { 'tw.Log.ArgumentCompleterState' }


    'tw.Log.ArgumentCompleterState' # 'tw.Log.ArgumentCompleterState' = { <none> }
    'tw.Log.NativeArgumentCompleterState' # 'tw.Log.NativeArgumentCompleterState' = { <none> }
    #
    'Render-TypeWriterArgumentCompleterName' # 'tw.Render.CompleterName'
    'tw.__getKeyNames' # 'tw.KeysOf'
    'tw.__getTypeNames' # 'tw.TypeOf'
    'Format-TypeWriterNormalizeLineEnding' # 'tw.Format-NormalizeLineEnding'
    'Export-TypeCompleterCommandCompletions' # 'Export-TypeCompleterCommandCompletions' = { 'tw.Export-CommandCompletions', 'Export-TwCommandCompletions' }
    #
    'New-TypeWriterCompletionResult' # 'tw.New-CompletionResult'
    # '*'
)
[Collections.Generic.List[Object]]$HardcodedToExportVariable = @(
    '__twAlwaysBreakInCompleterState' # 'tw.Log.NativeArgumentCompleterState'
)
[Collections.Generic.List[Object]]$HardcodedToExportAlias = @(
    'tw.Log.ArgumentCompleterState' # 'Log-TypeWriterNativeArgumentCompleterState' = { 'tw.Log. NativeArgumentCompleterState' }
    'tw.Log.NativeArgumentCompleterState' # 'Log-TypeWriterArgumentCompleterState' = { 'tw.Log. ArgumentCompleterState' }
    #
    'tw.KeysOf' # 'tw.__getKeyNames'
    'tw.Render.CompleterName' # 'Render-TypeWriterArgumentCompleterName'
    'tw.TypeOf' # 'tw.__getTypeNames'
    'tw.Format-NormalizeLineEnding' # 'Format-TypeWriterNormalizeLineEnding'
    #
    'tw.New-CompletionResult' # 'New-TypeWriterCompletionResult'
    'tw.Export-CommandCompletions'# 'Export-TypeCompleterCommandCompletions' = { 'tw.Export-CommandCompletions', 'Export-TwCommandCompletions' }
    'Export-TwCommandCompletions' # 'Export-TypeCompleterCommandCompletions' = { 'tw.Export-CommandCompletions', 'Export-TwCommandCompletions' }
    # '*'
)

# write-warning 'cheat for now on the export rules filtering, I am not yet sure which pattern I prefer'
Foreach ($FolderItem in 'Private', 'Public') {
    # [Collections.Generic.List[Object]]$ImportItemList = Get-ChildItem -Path $PSScriptRoot\$FolderItem\*.ps1 -ErrorAction SilentlyContinue
    # verbose # warning, better than this
    $getChildItemSplat = @{
        Path    = "$PSScriptRoot\$FolderItem\*.ps1"
        # ErrorAction = 'SilentlyContinue'
        Recurse = $true
    }

    # Set-PSBreakpoint -Command 'Set-Location' -Action { break }
    # Set-PSBreakpoint -Command 'Push-Location' -Action { break }
    # $ErrorActionPreference = 'break'
    [Collections.Generic.List[Object]]$ImportItemList = @(Get-ChildItem @getChildItemSplat)
    [Collections.Generic.List[Object]]$ToExportFunc   = @()
    [Collections.Generic.List[Object]]$ToExportAlias  = @()

    # [Collections.Generic.List[Object]]$ModMeta.Files = @(
    #     $ImportItemList | nin.AddProp -Name 'Stage' -Value '0_all'
    # )

    Foreach ($ImportItem in $ImportItemList) {
        Try {
            . $ImportItem
        }
        Catch {
            throw "Failed to import function $($importItem.fullname): $_"
        }
    }
    if ($FolderItem -eq 'Public') {
        [Collections.Generic.List[Object]]$ToExport = @(
            $ImportItemList.basename
            | Where-Object {
                $item = $_
                $isMatch = $item -match '^\w+-\w+$'
                $isMatch = $isMatch -or ( $_ -match '^\w+\.\w+$')
                $isMatch = $isMatch -or ( $__buildCfg.LooseFunctionImports )
                '{0} => {1}' -f @(
                    $isMatch , $Item
                ) | Write-Verbose
                return $isMatch
            }
        )

        if($hardcodedToExportFunc.count -gt 0) {
            $ToExportFunc.AddRange( @($hardcodedToExportFunc) )
                | Sort-Object -Unique
        }

        $ToExportFunc   | Join-String -sep ', ' -single -op 'ToExportFunc = @( ' -os ' )'
                        | Write-Verbose

        if($ToExportFunc.count -gt 0) {
            Export-ModuleMember -Function @(
                $ToExportFunc
            )
        }
        if($ToExportVariable.count -gt 0) {
            Export-ModuleMember -Variable @(
                $ToExportVariable
            )
        }

        if($hardcodedToExportAlias.count -gt 0) {
            $ToExportAlias.AddRange( @($hardcodedToExportAlias) )
                | Sort-Object -Unique
        }

        $ToExportAlias  | Join-String -sep ', ' -single -op 'ToExportAlias = @( ' -os ' )'
                        | Write-Verbose

        if($ToExportAlias.count -gt 0) {
            Export-ModuleMember -Alias @(
                $ToExportAlias
            )
        }
    }

    # todo: automate
    # Hardcoded native completers
    'Loading Arg Completers...' | Write-Verbose

    tw.Render.CompleterName -Command 'fd'
        | Write-Information -infa 'Continue'

    Register-TypeCompleterCommandFd

    tw.Render.CompleterName -Command 'Github'
        | Write-Information -infa 'Continue'

    Register-TypeCompleterCommandGithub

    tw.Render.CompleterName -Command 'Tsc'
        | Write-Information -infa 'Continue'

    Register-TypeCompleterCommandTsc


}

if ($__buildCfg.LoadTypeAndFormatdata) {
    Update-FormatData -PrependPath (Join-Path $PSScriptRoot 'TypeWriter.format.ps1xml' )
    Update-TypeData -PrependPath (Join-Path $PSScriptRoot 'TypeWriter.types.ps1xml' ) -ErrorAction Ignore
}
# }
# Export-ModuleMember -Cmdlet Find-Type, Find-Member, Format-MemberSignature, Get-Assembly, Get-Parameter -Alias *

pushd $script:______originalRootPath
