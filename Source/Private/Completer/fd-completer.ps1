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


            # [System.Management.Automation.CompletionResult]::new(
            #     '-a-strip-cwd-prefix',
            #     '-a-strip-cwd-prefix',
            #     'ParameterName',
            #     'By default, relative paths are prefixed with ''./'' when the output goes to a non interactive terminal
            # (TTY). Use this flag to disable this behaviour.'
            # )

            $completionSplat = @{
                Name         = 'a'
                listItemText = 'b'
                resultType   = 'Method'
                toolTip      = 'c'
            }

            tw.New-CompletionResult @completionSplat

        )

        # }
    }
    Register-ArgumentCompleter -Native -CommandName 'fd' -ScriptBlock $fd

}

