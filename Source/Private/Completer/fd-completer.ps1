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
    #>
    $fd = {
        param($wordToComplete, $commandAst, $cursorPosition)
        # dotnet complete --position $cursorPosition $commandAst.ToString()
        # | ForEach-Object {
        @(



            # $completionSplat = @{
            #     Name         = 'a'
            #     listItemText = 'b'
            #     resultType   = 'ParameterName'
            #     toolTip      = 'By default, relative paths are prefixed with ''./'' when the output goes to a non interactive terminal
            # (TTY). Use this flag to disable this behaviour.'
            # }
            # [System.Management.Automation.CompletionResult]::new($completionSplat)

            tw.New-CompletionResult -Text '--name' -listItemText '--name' -resultType ParameterName 'stuff'

            $longTip = @'
Change the current working directory of fd to the provided path. This means that search
            results will be shown with respect to the given base path. Note that relative paths
            which are passed to fd via the positional <path> argument or the '--search-path' option
            will also be resolved relative to this directory.
'@ # | tw.Format-NormalizeLineEnding # not needed? maybe on some configs? # -replace '\r?\n', "`n"
            tw.New-CompletionResult -Text '--base-directory' -listItemText '--base-directory' -resultType ParameterValue -toolTip $longTip
            # $longTip = 'a...b'

#             $longTip = @'
# Change the current working directory of fd to the provided path. This means that search
#             results will be shown with respect to the given base path. Note that relative paths
#             which are passed to fd via the positional <path> argument or the '--search-path' option
#             will also be resolved relative to this directory.
# '@ -replace '\r?\n', "`n"

            # tw.New-CompletionResult -name '--base-directory' '--base-directory' ParameterValue -toolTip $longTip


        )

        # }
    }
    Register-ArgumentCompleter -Native -CommandName 'fd' -ScriptBlock $fd
}

