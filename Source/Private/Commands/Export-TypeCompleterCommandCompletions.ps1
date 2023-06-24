

function Export-TypeCompleterCommandCompletions {
    <#
    .SYNOPSIS
        export or access completions raw data, to be used elsewhere, like generating markdown docs
    #>
    [Alias(
    )]
    [OutputType('System.String')]
    [CMdletBinding()]
    param(
        [Alias('Command')]
        [Parameter(Mandatory, Position = 0)]
        [ArgumentCompletions('fd', 'py', 'python')] # dynamically suggest
        [string]$CommandName
    )

    write-verbose 'nyi: make Export-TypeCompleterCommandCompletions dynamic'

    $cmdData = switch($CommandName) {
         'fd' {
            $script:__fdCompletionsData
         }
         'py' {
            $script:__pyCompletionsData
         }
         'python' {
            $script:__pythonCompletionsData
         }
         'sam' {
            $script:__samCompletionsData
         }
         'ping' {
            $script:__pingCompletionsData
         }
         'ipconfig' {
            $script:__ipconfigCompletionsData
         }
         'powershell' {
            $script:__powershellCompletionsData
         }
         'pwsh' {
            $script:__pwshCompletionsData
         }
         'bat' {
            $script:__batCompletionsData
         }
         'less' {
            $script:__lessCompletionsData
         }
         'vim' {
            $script:__vimCompletionsData
         }
         'nvim' {
            $script:__nvimCompletionsData
         }
         'nvim' {
            $script:__nvimCompletionsData
         }
         'nvim' {
            $script:__nvimCompletionsData
         }
         default {
            $varName = '__{0}'
            $commandData? =
            throw "UnhandledCommandName: '$CommandName'"
         }

    }

    return $cmdData
        | Sort-Object -Descending:$false

}
