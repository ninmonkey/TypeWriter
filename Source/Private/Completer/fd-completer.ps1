
$__fdCompletionsData = @(
    # future: Type coerces into
    @{
        ShortName = '-H'
        FullName  = '--hidden'
        Tooltip   = 'Search hidden files and directories'
    }
    @{
        ShortName = '-I'
        FullName  = '--no-ignore'
        Tooltip = 'Do not respect .(git|fd)ignore files'
    }
    @{
        ShortName = '-s'
        FullName  = '--case-sensitive'
        ToolTip = 'Case-sensitive search (default: smart case)'
    }
    @{
        ShortName = '-i'
        FullName  = '--ignore-case'
        ToolTip = 'Case-insensitive search (default: smart case)'
    }
    @{
        ShortName = '-g'
        FullName  = '--glob'
        ToolTip = 'Glob-based search (default: regular expression)'
        Url = '<link to glob syntax here...>'

    }
    @{
        ShortName = '-a'
        FullName  = '--absolute-path'
        ToolTip = 'Show absolute instead of relative paths'
    }
    @{
        ShortName = '-l'
        FullName  = '--list-details'
        ToolTip = 'Use a long listing format with file metadata'
    }
    @{
        ShortName = '-L'
        FullName  = '--follow'
        ToolTip = 'Follow symbolic links'
    }
    @{
        ShortName = '-p'
        FullName  = '--full-path'
        ToolTip = 'Search full abs. path (default: filename only)'
    }
    @{
        ShortName = '-d'
        FullName  = '--max-depth'
        ToolTip = 'Set maximum search depth (default: none)'
        Rest      = ' <depth>'
    }
    @{
        ShortName = '-t'
        FullName  = '--type'
        ToolTip = 'Filter by type: file (f), directory (d), symlink (l),
                                       executable (x), empty (e), socket (s), pipe (p)'
        Rest      = ' <filetype>'
    }
    @{
        ShortName = '-e'
        FullName  = '--extension'
        ToolTip = 'Filter by file extension'
        Rest      = ' <ext>'
    }
    @{
        ShortName = '-x'
        FullName  = '--exec'
        ToolTip = 'Execute a command for each search result'
        Rest      = ' <cmd>...'
    }
    @{
        ShortName = '-X'
        FullName  = '--exec-batch'
        ToolTip = 'Execute a command with all search results at once'
        Rest      = ' <cmd>...'
    }
    @{
        ShortName = '-E'
        FullName  = '--exclude'
        ToolTip = 'Exclude entries that match the given glob pattern'
        Rest      = ' <pattern>'
    }
    @{
        ShortName = '-c'
        FullName  = '--color'
        ToolTip = 'When to use colors: never, *auto*, always'
        Rest      = ' <when>'
    }
    @{
        ShortName = '-S'
        FullName  = '--size'
        ToolTip = 'Limit results based on the size of files'
        Rest      = ' <size>'
    }
    @{
        ShortName = '-h'
        FullName  = '--help'
        ToolTip = 'Print help information'
    }
    @{
        ShortName = '-V'
        FullName  = '--version'
        ToolTip = 'Print version information'
    }
    @{
        # ShortName = '-V'
        FullName  = '--changed-within'
        ArgType = '<date|dur>'
        ToolTip = '<date|dur> Filter by file modification time (newer than)'
        LongHelp = 'super long doc string'
    }
    @{
        # ShortName = '-V'
        FullName  = '--changed-before'
        ArgType = '<date|dur>'
        ToolTip = 'Filter by file modification time (older than)'
        LongHelp = 'super long doc string'
    }
)

function __generateCompletions_fd {
    # not the cleanest, but generates two records if there is an alias, else 1
    $GenerationModeNew = $false
    if ($GenerationModeNew) {
        write-warning 'may not quite work yet'
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


    if (-not $GenerationModeNew -and 'old conversion') {
        return $__fdCompletionsData | % {
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
