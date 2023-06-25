

function Export-TypeCompleterCommandCompletions {
    <#
    .SYNOPSIS
        export or access completions raw data, to be used elsewhere, like generating markdown docs
    .notes
        maybe see: '__generateCompletions_fd'
    .LINK
        Find-TypeWriterArgumentCompleters
    .LINK
        Export-TypeCompleterCommandCompletions
    .LINK
        __generateCompletions_fd
    .EXAMPLE
        Tw.Export-CommandCompletions github
    .EXAMPLE
        # slight variations
        Tw.Export-CommandCompletions github | Json | Json.from
        Tw.Export-CommandCompletions github -RawOutput
        Tw.Export-CommandCompletions github -RawOutput | Json | Json.From

    #>
    [Alias(
        'Export-TwCommandCompletions',
        'tw.Export-CommandCompletions'
    )]
    [OutputType('Object[]')]
    [CmdletBinding()]
    param(
        [Alias('Command')]
        [Parameter(Mandatory, Position = 0)]
        [ArgumentCompletions('fd', 'py', 'python')] # todo: dynamically suggest
        [string]$CommandName,

        [switch]$RawOutput
    )

    write-verbose 'nyi: make Export-TypeCompleterCommandCompletions dynamic'
    $debug_EnableOldClassMode = $false

    $whatVar = '__{0}CompletionsData' -f @($CommandName)
    $cmdCompletionsData? = Get-variable -Scope 'Script' -Name $whatVar -ValueOnly -ea 'Ignore'
    if($null -eq $cmdCompletionsData?) {
        throw "UnhandledCommandName: '$CommandName'"
    }

    if($RawOutput) {
        return $cmdCompletionsData?
            | Sort-Object -Descending:$false
    }

    if($debug_EnableOldClassMode) {
         $GenerationModeNew = $false
        if ($GenerationModeNew) {
            Write-Warning 'may not quite work yet'
            return $__fdCompletionsData | % {
                [TWCompletionResult]::new( $_ ).AsCompletionResult()

                if ( -not [string]::IsNullOrWhiteSpace( $_.ShortName ) ) {
                    $hashAlias = [hashtable]::new( $_ )
                    $hashAlias.FullName = $hashAlias.ShortName
                    [TWCompletionResult]::new( $hashAlias ).AsCompletionResult()
                }
            }
            return
        }
        return
    }

    return $cmdCompletionsData? | % {
        $record = $_
        $NewCompletionResultSplat = @{
            Text         = $record.FullName
            listItemText = $record.FullName
            resultType   = 'ParameterValue'
            toolTip      = $record.ToolTip ?? '<missing>'
        }
        if ($record.ShortName) {
            $NewCompletionResultSplat.Alias = $record.ShortName
        }
        tw.New-CompletionResult @NewCompletionResultSplat
    } | Sort-Object CompletionText
}
