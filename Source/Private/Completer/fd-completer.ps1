
$__fdCompletionsData = @(

    @{
        ShortName = '-H'
        FullName  = '--hidden'
        Tooltip = 'Search hidden files and directories'
    }
    @{
        ShortName = '-I'
        FullName  = '--no-ignore'
    }
    @{
        ShortName = '-s'
        FullName  = '--case-sensitive'
    }
    @{
        ShortName = '-i'
        FullName  = '--ignore-case'
    }
    @{
        ShortName = '-g'
        FullName  = '--glob'
    }
    @{
        ShortName = '-a'
        FullName  = '--absolute-path'
    }
    @{
        ShortName = '-l'
        FullName  = '--list-details'
    }
    @{
        ShortName = '-L'
        FullName  = '--follow'
    }
    @{
        ShortName = '-p'
        FullName  = '--full-path'
    }
    @{
        ShortName = '-d'
        FullName  = '--max-depth'
        Rest      = ' <depth>'
    }
    @{
        ShortName = '-t'
        FullName  = '--type'
        Rest      = ' <filetype>'
    }
    @{
        ShortName = '-e'
        FullName  = '--extension'
        Rest      = ' <ext>'
    }
    @{
        ShortName = '-x'
        FullName  = '--exec'
        Rest      = ' <cmd>...'
    }
    @{
        ShortName = '-X'
        FullName  = '--exec-batch'
        Rest      = ' <cmd>...'
    }
    @{
        ShortName = '-E'
        FullName  = '--exclude'
        Rest      = ' <pattern>'
    }
    @{
        ShortName = '-c'
        FullName  = '--color'
        Rest      = ' <when>'
    }
    @{
        ShortName = '-S'
        FullName  = '--size'
        Rest      = ' <size>'
    }
    @{
        ShortName = '-h'
        FullName  = '--help'
    }
    @{
        ShortName = '-V'
        FullName  = '--version'
    }
)

function __generateCompletions_fd  {

    return $__fdCompletionsData | %{
        $record = $_
        $NewCompletionResultSplat = @{
            Text = $record.FullName
            listItemText = $record.FullName
            resultType = 'ParameterValue'
            toolTip = $record.ToolTip ?? '<missing>'
        }
        if($record.ShortName){
            $NewCompletionResultSplat.Alias = $record.ShortName
        }
        tw.New-CompletionResult @NewCompletionResultSplat
    } | Sort-Object CompletionText

}

function Register-TypeCompleterCommandFdFind {
    <#
    .SYNOPSIS
        completions to 'fd'
    .DESCRIPTION
        from <https://github.com/sharkdp/fd#features>
    .NOTES
    General notes
    .LINK
        https://github.com/sharkdp/fd#features
    .LINK
        https://docs.rs/regex/1.0.0/regex/#syntax
    .NOTES
        see also: <file:///H:\data\2023\dotfiles.2023\pwsh\src\autoloadNow_ArgumentCompleter-butRefactor.ps1>
    future:
        - [ ] Does ParameterValue allow me to suggest paths for --base-directory ?
        - [ ] or would it require parsing the token to see if the next suggest should be one?
    #>
    $fd = {
        param($wordToComplete, $commandAst, $cursorPosition)

        return [Collections.Generic.List[Object]]$GeneratedCompletions = @(
            __generateCompletions_fd
        ) | Sort-Object CompletionText

        throw 'ShouldNeverReachException: Dead code'
        if ($false -and 'original') {
            [Collections.Generic.List[Object]]$GeneratedCompletions = @(
                tw.New-CompletionResult -Text '--name' -listItemText '--name' -resultType ParameterName 'stuff'

                $longTip = @'
Change the current working directory of fd to the provided path. This means that search
            results will be shown with respect to the given base path. Note that relative paths
            which are passed to fd via the positional <path> argument or the '--search-path' option
            will also be resolved relative to this directory.
'@ # | tw.Format-NormalizeLineEnding # not needed? maybe on some configs? # -replace '\r?\n', "`n"
                tw.New-CompletionResult -Text '--base-directory' -listItemText '--base-directory' -resultType ParameterValue -toolTip $longTip

                $longTip = @'
'@
                tw.New-CompletionResult -Text '--base-directory' -listItemText '--base-directory' -resultType ParameterValue -toolTip $longTip
            )
            return $GeneratedCompletions
        }
    }
    Register-ArgumentCompleter -Native -CommandName 'fd' -ScriptBlock $fd
}

$null = 0
