# New-completion?
# function completers.SamTopLevel {}
# function completions.SamTopLevel {}

function Register-TypeCompleterCommandSamTopLevel {
    <#
    .SYNOPSIS
    wrap completions for Sam Top-Level

    .DESCRIPTION
    from: <https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html>



    .EXAMPLE
    An example

    .NOTES
    General notes
    .LINK
        https://github.com/sharkdp/fd#features
    .LINK
        https://docs.rs/regex/1.0.0/regex/#syntax
    #>

}

$docs = @'

sam build --use-container --parallel --debug --cached --profile Name

'@
class SamBuildCompletion {
    [string]$completionText = [string]::Empty
    [string]$listItemText = [string]::Empty
    [System.Management.Automation.CompletionResultType]$resultType
    [string]$toolTip = [string]::Empty

    SamBuildCompletion(
        [string]$completionText,
        [string]$listItemText,
        [System.Management.Automation.CompletionResultType]$resultType,
        [string]$toolTip
    ) {
        $this.completionText = $completionText
        $this.listItemText = $listItemText
        $this.resultType = $resultType
        $this.toolTip = $toolTip
    }
}

function newSamBuildCompletion {
    [CmdletBinding()]
    # [Alias('newSamBuildCompletion')]
    param(
        [string]$Name,
        [string]$listItemText,
        [System.Management.Automation.CompletionResultType]$resultType,
        [string]$toolTip
    )

    return [SamBuildCompletion]::new(
        $Name,
        $listItemText,
        $resultType,
        $toolTip
    )
}

[Collections.Generic.List[Object]]$script:__samCompletions = @(
   newSamBuildCompletion '--use-container' 'asContainer' ([System.Management.Automation.CompletionResultType]::Command) -toolTip 'Use a container to build your function'
)

function Register-TypeCompleterCommandSamTopLevel {

}


'show'
$script:__samCompletions | Ft -auto
