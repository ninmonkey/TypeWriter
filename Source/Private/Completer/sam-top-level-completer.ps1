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
    # wrapper for
    [string]$completionText = [string]::Empty
    [string]$listItemText = [string]::Empty
    [System.Management.Automation.CompletionResultType]$resultType
    [string]$toolTip = [string]::Empty
    hidden [datetime]$Created

    SamBuildCompletion(
        [string]$completionText,
        [string]$listItemText,
        [System.Management.Automation.CompletionResultType]$resultType,
        [string]$toolTip
    ) {
        $this.Created = [datetime]::Now
        $this.completionText = $completionText
        $this.listItemText = $listItemText
        $this.resultType = $resultType
        $this.toolTip = $toolTip
    }
}

function newSamBuildCompletion {
    <#
    .SYNOPSIS
        used for creating a new SamBuildCompletion object
    .notes
        see internal classes:
            - [SamBuildCompletion]

        see:
        - [CompletionResult](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.CompletionResult?view=powershellsdk-7.2.0)
        - [CompletionResultType](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.completionresulttype?view=powershellsdk-7.2.0)
    .EXAMPLE
    #>
    [OutputType('System.Management.Automation.CompletionResult', 'SamBuildCompletion')]
    [CmdletBinding()]
    # [Alias('newSamBuildCompletion')]
    param(
        # pattern
        [Parameter(Mandatory)]
        [string]$Name,

        # the replacement ?
        [Parameter(Mandatory)]
        [string]$listItemText,

        # the type of completion
        [Parameter(Mandatory)]
        [System.Management.Automation.CompletionResultType]$resultType,

        # the tooltip for menuCompletions
        [Parameter(Mandatory)]
        [string]$toolTip
    )

    return [SamBuildCompletion]::new(
        $Name,
        $listItemText,
        $resultType,
        $toolTip
    )
}

[Collections.Generic.List[Object]]$script:__samCompletions = @()

[Collections.Generic.List[Object]]$script:__testCompletions = @(
    # [StyleA] test alternate invocations
    newSamBuildCompletion '--use-container' 'asContainer' ([System.Management.Automation.CompletionResultType]::Command) -toolTip 'Use a container to build your function'

    # [StyleB] test alternate invocations
    $newSamBuildCompletionSplat = @{
        Name         = '--use-container'
        listItemText = 'asContainer'
        resultType   = [System.Management.Automation.CompletionResultType]::Command
        toolTip      = 'Use a container to build your function'
    }
    newSamBuildCompletion @newSamBuildCompletionSplat

    # [StyleC] test alternate invocations, requires a new parameter
    <#
    newSamBuildCompletion @(
        '--use-container'
        'asContainer'
        [System.Management.Automation.CompletionResultType]::Command
        'Use a container to build your function'
    )
    #>
)
$script:__testCompletions | Format-Table -auto

function Register-TypeCompleterCommandSamTopLevel {

}


'show'
