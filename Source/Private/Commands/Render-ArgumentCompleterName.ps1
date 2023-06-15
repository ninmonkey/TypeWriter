

function Render-TypeWriterArgumentCompleterName {
    [Alias(
        '.Fmt.CompleterName',
        'tw.Render.CompleterName'
    )]
    [OutputType('System.String')]
    [CMdletBinding()]
    param(
        [Alias('Command')]
        [Parameter(Mandatory, Position = 0)]
        [string]$CommandName,

        [Alias('Param')]
        [Parameter()]
        [string]$ParameterName
    )
    $cFg = $PSStyle.Foreground.FromRgb('#c7af51')
    $cFg = $PSStyle.Foreground.FromRgb('#c99067')

    $cBg = $PSStyle.Background.FromRgb('#c7af51')
    $cBg = $PSStyle.Background.FromRgb('#c99067')

    if(-not $ParameterName) {
        '   registerCompleter => {0}' -f @(
        # 'registerCompleter: {0}' -f @(
            $CommandName ?? '?'
        )   | Join-String -op $cFg -os $PSStyle.Reset
        return
    }

    '   registerCompleter => {0}: {1}' -f @(
        $CommandName ?? '?'
        $ParameterName ?? '?'
    )   | Join-String -op $cFg -os $PSStyle.Reset

    return

}
