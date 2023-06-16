# New-completion?
# function completers.fdFind {}
# function completions.fdFind {}

function Register-TypeCompleterCommandFdFind {
    <#
    .SYNOPSIS
    wrap completions for Fd Search

    .DESCRIPTION
    from <https://github.com/sharkdp/fd#features>

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

function Register-TypeCompleterCommandFdFind {
    <#
    .SYNOPSIS
        completions to 'fd'
    .NOTES
        see also: <file:///H:\data\2023\dotfiles.2023\pwsh\src\autoloadNow_ArgumentCompleter-butRefactor.ps1>
    future:
        - [ ] Does ParameterValue allow me to suggest paths for --base-directory ?
        - [ ] or would it require parsing the token to see if the next suggest should be one?
    #>
    $fd = {
        param($wordToComplete, $commandAst, $cursorPosition)
        [Collections.Generic.List[Object]]$GeneratedCompletions = @(
            tw.New-CompletionResult -Text '--name' -listItemText '--name' -resultType ParameterName 'stuff'

            $longTip = @'
Change the current working directory of fd to the provided path. This means that search
            results will be shown with respect to the given base path. Note that relative paths
            which are passed to fd via the positional <path> argument or the '--search-path' option
            will also be resolved relative to this directory.
'@ # | tw.Format-NormalizeLineEnding # not needed? maybe on some configs? # -replace '\r?\n', "`n"
            tw.New-CompletionResult -Text '--base-directory' -listItemText '--base-directory' -resultType ParameterValue -toolTip $longTip
        )
        return $GeneratedCompletions
    }
    Register-ArgumentCompleter -Native -CommandName 'fd' -ScriptBlock $fd
}

