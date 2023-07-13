
function Log-TypeWriterArgumentCompleterState {
    <#
    .NOTES
    - <https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_argument_completion?view=powershell-7.3#argumentcompleter-attribute>
    - <https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/register-argumentcompleter?view=powershell-7.3#-scriptblock>
    - <https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.argumentcompleterattribute?view=powershellsdk-7.3.0>

related types:

    - [Ast]
    - [ChainableAst]
    - [CommandAst]
    - [CommandBaseAst]
    - [PipelineAst]
    - [PipelineBaseAst]
    - [StatementAst]


    #>
    [Alias('tw.Log.ArgumentCompleterState')] # Log-TypeWriterArgumentCompleterState
    [CmdletBinding()]
    param (
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters,
        [hashtable]$ExtraInfo = @{}
    )

    $PSCmdlet.MyInvocation.BoundParameters
        | ConvertTo-Json -Depth 2 -Compress
        | Join-String -op 'Func::tw.Log.ArgumentCompleterState: '
        | write-debug -debug

    if($script:__twAlwaysBreakInCompleterState) {
        write-warning '$script:__twAlwaysBreakInCompleterState is true'
        wait-debugger
    }
}
