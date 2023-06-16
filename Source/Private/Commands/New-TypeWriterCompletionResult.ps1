class TWCompletionResult {
    # wrapper for [CompletionResult]
    # currently doesn't do anything special
    [string]$completionText = [string]::Empty
    [string]$listItemText   = [string]::Empty
    [System.Management.Automation.CompletionResultType]$resultType
    [string]$toolTip        = [string]::Empty
    hidden [datetime]$Created

    TWCompletionResult(
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
    [System.Management.Automation.CompletionResult] AsCompletionResult() {
        # quick hack, because it doesn't auto coerce to a [CompletionResult]
        return [System.Management.Automation.CompletionResult]::new(
            $this.completionText,
            $this.listItemText,
            $this.resultType,
            $this.toolTip
        )
    }
}

function New-TypeWriterCompletionResult {
    <#
    .SYNOPSIS
        used for creating a new TWCompletionResult object
    .notes
        see internal classes:
            - [TWCompletionResult]

        see:
        - [CompletionResult](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.CompletionResult?view=powershellsdk-7.2.0)
        - [CompletionResultType](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.completionresulttype?view=powershellsdk-7.2.0)
    .EXAMPLE
    #>
    [OutputType('System.Management.Automation.CompletionResult', 'TWCompletionResult')]
    [CmdletBinding()]
    [Alias('tw.New-CompletionResult')]
    param(
        # base Name
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory, position=0)]
        [string]$Text,

        # MenuCompletion name
        [ValidateNotNullOrEmpty()]
        [Alias('List')]
        [Parameter(Mandatory, position=1)]
        [string]$listItemText,

        # completion kind
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory, position=2)]
        [Alias('Kind', 'Type')]
        [System.Management.Automation.CompletionResultType]$resultType,

        # tooltip on MenuComplete
        [ValidateNotNullOrEmpty()]
        # the tooltip for menuCompletions
        [Parameter(Mandatory, position=3)]
        [string]$toolTip,

        # creates a 2nd record, usiing an alias
        [ValidateNotNullOrEmpty()]
        [Alias('ShortText')]
        # the tooltip for menuCompletions
        [Parameter(Position=4)]
        [string]$Alias
    )

          # [System.Management.Automation.CompletionResult]::new(
            #     '-ToB',  <# tab shows #>
            #     '-ToC',  <# ctrl+space shows #>
            #     'ParameterName', <# kind #>
            #     '-ToA'   <# tooltip #>
            # )

    return @(
        if( -not [string]::IsNullOrWhiteSpace($Alias) ) {
            ([TWCompletionResult]::new(
                $Alias,         <# on tab #>
                $listItemText, <# on menuComplete #>
                $resultType,   <# kind #>
                $toolTip       <# tooltip #>
            )).AsCompletionResult()
        }
        ([TWCompletionResult]::new(
            $Text,         <# on tab #>
            $listItemText, <# on menuComplete #>
            $resultType,   <# kind #>
            $toolTip       <# tooltip #>
        )).AsCompletionResult()
    )
}
