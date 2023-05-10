
function Register-TypeCompleterCommandPowerQueryTopLevel {
    <#
    .SYNOPSIS
    wrap completions for PowerQuery Top-Level

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
'@

function tw.Find-PowerQueryCommands {
    # are any others interesting?
    $Paths = @{
        ExtensionsRoot = Join-Path $Env:UserProfile '.vscode/extensions'
    }
    $Paths.PqDirs = Get-ChildItem -Path $Paths.ExtensionsRoot *vscode-powerquery*



    $newestPqSdk = Get-ChildItem -Path (Join-Path $Env:UserProfile '.vscode')

    Get-ChildItem $paths.ExtensionsRoot

    $Paths.NewestPqSDK = ''
    $Paths.NewestPqWithoutSDK = ''

    # $script:__cachedQuery

    Get-ChildItem -Path $Paths.ExtensionsRoot -Filter '*power*query*'

    $Paths.ExtensionsRoot

    $Paths.NewestPqWithoutSDK = Get-ChildItem -Path $paths.ExtensionsRoot *power*query*
    | Where-Object FullName -NotMatch '-sdk-'
    | Sort-Object LastWriteTIme -Descending -Top 1

    $Paths.NewestPqSdk = Get-ChildItem -Path $paths.ExtensionsRoot *power*query*
    | Where-Object FullName -Match '-sdk-'
    | Sort-Object LastWriteTIme -Descending -Top 1


    return

    $newestRoot = Get-ChildItem 'C:\Users\cppmo_000\.vscode\extensions\powerquery.vscode-powerquery-sdk*'
    | Sort-Object LastWriteTime -Descending
    | Select-Object -First 1

    $newestPqSdk = Get-ChildItem -Path $Paths.ExtensionsRoot *power*query*
    | Where-Object Name -Match 'powerquery.vscode-powerquery'
    | Where-Object -Not -Match '-sdk-'
    | Sort-Object LastWriteTime -Descending -Top 1

    $newestPqSdk = Get-ChildItem -Path $Paths.ExtensionsRoot *power*query*
    | Where-Object Name -Match 'powerquery.vscode-powerquery-sdk'
    | Sort-Object LastWriteTime -Descending -Top 1


    $extensionsRoot = Join-Path $Env:UserProfile '.vscode/extensions'

    (
        $script:__cachedQuery ??= Get-ChildItem -Path $extensionsRoot *.exe -Recurse
        | Where-Object { $_.FullName -match 'powerquery.vscode-powerquery-sdk' }
        | Sort-Object LastWriteTime, Directory, Name -Descending
        # | Sort-Object LastWriteTime -Descending
    )
}

class PowerQueryBuildCompletion {
    # wrapper for
    [string]$completionText = [string]::Empty
    [string]$listItemText = [string]::Empty
    [System.Management.Automation.CompletionResultType]$resultType
    [string]$toolTip = [string]::Empty
    hidden [datetime]$Created

    PowerQueryBuildCompletion(
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

function newPowerQueryBuildCompletion {
    <#
    .SYNOPSIS
        used for creating a new PowerQueryBuildCompletion object
    .notes
        see internal classes:
            - [PowerQueryBuildCompletion]

        see:
        - [CompletionResult](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.CompletionResult?view=powershellsdk-7.2.0)
        - [CompletionResultType](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.completionresulttype?view=powershellsdk-7.2.0)
    .EXAMPLE
    #>
    [OutputType('System.Management.Automation.CompletionResult', 'PowerQueryBuildCompletion')]
    [CmdletBinding()]
    # [Alias('newPowerQueryBuildCompletion')]
    param(
        # pattern
        [Parameter(Mandatory, Position = 0)]
        [string]$Name,

        # the replacement ?
        [Parameter(Mandatory, Position = 1)]
        [string]$listItemText,

        # the type of completion
        [Parameter(Mandatory, Position = 2)]
        [System.Management.Automation.CompletionResultType]$resultType,

        # the tooltip for menuCompletions
        [Parameter(Mandatory, Position = 3)]
        [string]$toolTip
    )

    return [PowerQueryBuildCompletion]::new(
        $Name,
        $listItemText,
        $resultType,
        $toolTip
    )
}

[Collections.Generic.List[Object]]$script:__PowerQueryCompletions = @()

[Collections.Generic.List[Object]]$script:__testCompletions = @(
    # [StyleA] test alternate invocations
    newPowerQueryBuildCompletion '--use-container' 'asContainer' ([System.Management.Automation.CompletionResultType]::Command) -toolTip 'Use a container to build your function'

    # [StyleB] test alternate invocations
    $newPowerQueryBuildCompletionSplat = @{
        Name         = '--use-container'
        listItemText = 'asContainer'
        resultType   = [System.Management.Automation.CompletionResultType]::Command
        toolTip      = 'Use a container to build your function'
    }
    newPowerQueryBuildCompletion @newPowerQueryBuildCompletionSplat

    # [StyleC] test alternate invocations, requires a new parameter
    <#
    newPowerQueryBuildCompletion @(
        '--use-container'
        'asContainer'
        [System.Management.Automation.CompletionResultType]::Command
        'Use a container to build your function'
    )
    #>
)
$script:__testCompletions | Format-Table -auto

function Register-TypeCompleterCommandPowerQueryTopLevel {

}
