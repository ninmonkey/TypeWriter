<# templateFrom: 2023-06-24
github.exe

- see: <https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop>

USAGE:

Commands:
    clone <url|slug>  Clone a repository
    help [command]    Show the help page for a command
    open <path>       Open a git repository in GitHub Desktop

    Run github help <command> for details about each command

#>

$script:__githubCompletionsData = @(
    # future: Type coerces into
    @{
        FullName  = 'help'
        Rest = '<subCommand>'
        ToolTip   = '[subCommand] Show the help page for a command
    Ps> help <command>
'
    }
    @{
        # ShortName = '-H'
        IsSubCommand = $True
        FullName  = 'clone'
        Rest = '<url|slug>'
        Tooltip   = '[subCommand] Clone a repository
    Ps> clone <url|slug>
'
        LongHelp = @'
github clone <url|slug> [--branch]

Clone a repository

Options:
    --branch, -b  The branch to checkout after cloning  [string]

Arguments:
    url|slug  (required)  The URL or the GitHub owner/name alias to clone  [string]
'@
    }
    @{
        # ShortName = '-H'
        IsSubCommand = $True
        FullName  = 'open'
        Rest = '<path>'
        Tooltip   = '[subCommand] open a repository
    Ps> open <path>
'
    }
#     @{
#         IsSubCommand = $True
#         # ShortName = '-X'
#         FullName = '--search-path'
#         ToolTip  = 'paths to search as an alternative to the positional <path> argument'
#         Rest     = '<path>'
#         LongHelp = @'
# --search-path <search-path>
# Provide paths to search as an alternative to the positional <path> argument. Changes
#         github [OPTIONS] --search-path <path> --search-path <path2> [<pattern>]
# '@ | tw.Format-NormalizeLineEnding
#     }
)

function __generateCompletions_github {
    # not the cleanest, but generates two records if there is an alias, else 1
    # $GenerationModeNew = $false
    # if ($GenerationModeNew) {
    #     write-warning 'may not quite work yet'
    #     return $__githubCompletionsData | % {
    #         [TWCompletionResult]::new( $_ ).AsCompletionResult()

    #         if ( -not [string]::IsNullOrWhiteSpace( $_.ShortName ) ) {
    #             $hashAlias = [hashtable]::new( $_ )
    #             $hashAlias.FullName = $hashAlias.ShortName
    #             [TWCompletionResult]::new( $hashAlias ).AsCompletionResult()
    #         }
    #     }
    #     return
    # }

    return $script:__githubCompletionsData | % {
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

function Register-TypeCompleterCommandGithub {
    <#
    .SYNOPSIS
        completions to 'github'
    .DESCRIPTION

    .NOTES
    future:
        - [ ] todo: allow sub commands using a tree structure

    .EXAMPLE
        Register-TypeCompleterCommandgithub

    #>
    $cmdScriptBlock = {
        param($wordToComplete, $commandAst, $cursorPosition)

        return [Collections.Generic.List[Object]]$GeneratedCompletions = @(
            __generateCompletions_github
        ) | Sort-Object CompletionText
    }
    Register-ArgumentCompleter -Native -CommandName 'github' -ScriptBlock $cmdScriptBlock
}
