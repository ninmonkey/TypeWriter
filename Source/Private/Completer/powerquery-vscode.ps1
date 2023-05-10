
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
    [CmdletBinding()]
    param(
        # I am not sure whether the non-extension binaries are of interest if the
        # SDK is installed, however, they are separate for now.
        [switch]$IncludeNonSDK
    )
    Write-Warning 'IncludeNonSDK not including doubles yet, correctly'
    # are any others interesting?
    $Config = @{
        OnlyVersionSdk = $false
    }
    if ($IncludeNonSDK) {
        $Config.OnlyVersionSdk = $true
    }
    $Paths = @{
        ExtensionsRoot = Join-Path $Env:UserProfile '.vscode/extensions'
    }
    $Paths.PqDirs = Get-ChildItem -Path $Paths.ExtensionsRoot -Filter '*vscode-powerquery*'

    $Paths.NewestPqWithoutSDK = Get-ChildItem -Path $paths.ExtensionsRoot -Filter '*power*query*'
    | Where-Object FullName -NotMatch '-sdk-'
    | Sort-Object LastWriteTIme -Descending -Top 1

    $Paths.NewestPqSdk = Get-ChildItem -Path $paths.ExtensionsRoot -Filter '*power*query*'
    | Where-Object FullName -Match '-sdk-'
    | Sort-Object LastWriteTIme -Descending -Top 1

    $getChildItemSplat = @{
        Path    = @(
            $Paths.NewestPqSDK
            if (-not $Config.OnlyVersionSdk) {
                $paths.NewestPqWithoutSDK
            }
        )
        Recurse = $true
        Filter  = '*.exe'
    }


    (
        $script:__cachedQuery = Get-ChildItem @getChildItemSplat -File
        | Where-Object { $_.FullName -match 'powerquery.vscode-powerquery-sdk' }
        | Sort-Object Directory, LastWriteTime, Name -Descending
        # | Sort-Object LastWriteTime, Directory, Name -Descending
        # | Sort-Object LastWriteTime -Descending
    )
}

tw.Find-PowerQueryCommands

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