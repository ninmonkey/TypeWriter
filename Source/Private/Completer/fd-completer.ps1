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
    $fd = {
        param($wordToComplete, $commandAst, $cursorPosition)
        # dotnet complete --position $cursorPosition $commandAst.ToString()
        # | ForEach-Object {
        @(

            [System.Management.Automation.CompletionResult]::new(
                '--paging',
                '--paging',
                'ParameterName',
                '--paging'
            )
            # [System.Management.Automation.CompletionResult]::new(
            #     'always',
            #     'always',
            #     'ParameterValue',
            #     'always'
            # )
            [System.Management.Automation.CompletionResult]::new(
                '--strip-cwd-prefix',
                '--strip-cwd-prefix',
                'ParameterName',
                'By default, relative paths are prefixed with ''./'' when the output goes to a non interactive terminal
            (TTY). Use this flag to disable this behaviour.'
            )
        )

        # }
    }
    Register-ArgumentCompleter -Native -CommandName 'fd' -ScriptBlock $fd

}

