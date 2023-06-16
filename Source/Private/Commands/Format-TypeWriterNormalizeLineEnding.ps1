function Format-TypeWriterNormalizeLineEnding {
    <#
    .SYNOPSIS
        Normalize CrLF endings as LF only
    .EXAMPLE
        $someText | Format-TypeWriterNormalizeLineEnding
    #>
    [Alias('tw.Format-NormalizeLineEnding')]
    [CmdletBinding()]

    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [string]$InputText
    )
    process {
        $InputText -replace '\r?\n', "`n"
    }
}
