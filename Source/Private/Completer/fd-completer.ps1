<#
Note: `fd -h` prints a short and concise overview while `fd --help` gives all details.

fd 8.4.0

USAGE:
    fd.exe [OPTIONS] [--] [pattern] [path]...

ARGS:
    <pattern>
            the search pattern which is either a regular expression (default) or a glob pattern (if
            --glob is used). If no pattern has been specified, every entry is considered a match. If
            your pattern starts with a dash (-), make sure to pass '--' first, or it will be
            considered as a flag (fd -- '-foo').

    <path>...
            The directory where the filesystem search is rooted (optional). If omitted, search the
            current working directory.
#>
$__fdCompletionsData = @(
    # future: Type coerces into
    @{
        ShortName = '-H'
        FullName  = '--hidden'
        Tooltip   = 'Search hidden files and directories'

        LongHelp = @'
-H, --hidden
        Include hidden directories and files in the search results (default: hidden files and
        directories are skipped). Files and directories are considered to be hidden if their
        name starts with a '.' sign (dot). The flag can be overridden with --no-hidden.
'@
    }
    @{
        FullName  = '-1'
        Tooltip   = ' Limit the search to a single result and quit immediately. This is an alias for
            ''--max-results=1''.'
    }
    @{
        ShortName = '-q'
        FullName  = '-quiet'
        Tooltip   = ' When the flag is present, the program does not print anything and will return with an
            exit code of 0 if there is at least one match. Otherwise, the exit code will be 1.
            ''--has-results'' can be used as an alias.'
    }
    @{
        ShortName = '-I'
        FullName  = '--no-ignore'
        Tooltip = 'Do not respect .(git|fd)ignore files'
        LongHelp = @'
-I, --no-ignore
        Show search results from files and directories that would otherwise be ignored by
        '.gitignore', '.ignore', '.fdignore', or the global ignore file. The flag can be
        overridden with --ignore.
'@

    }
    @{

        FullName  = '--no-ignore-vcs'
        Tooltip = 'Show results that are hidden from .gitignore files. Override with --ignore-vcs'
        LongHelp = @'
--no-ignore-vcs
    Show search results from files and directories that would otherwise be ignored by
    '.gitignore' files. The flag can be overridden with --ignore-vcs.
'@
    }
    @{

        FullName  = '--no-ignore-parent'
        Tooltip = 'Show results that would be ignored by ''.gitignore'', ''.ignore'', or ''.fdignore'' files in parent directories.'
        LongHelp = @'
--no-ignore-parent
    Show search results from files and directories that would otherwise be ignored by
    '.gitignore', '.ignore', or '.fdignore' files in parent directories.
'@
    }
    @{
        ShortName = '-s'
        FullName  = '--case-sensitive'
        ToolTip = 'Case-sensitive search (default: smart case)'
        LongHelp = @'
Perform a case-sensitive search. By default, fd uses case-insensitive searches, unless
        the pattern contains an uppercase character (smart case).
'@
    }
    @{
        ShortName = '-i'
        FullName  = '--ignore-case'
        ToolTip = 'Case-insensitive search (default: smart case)'
        LongHelp = 'Perform a case-insensitive search. By default, fd uses case-insensitive searches, unless
        the pattern contains an uppercase character (smart case).'
    }
    @{
        FullName  = '--ignore-file'
        Rest = '<path>'
        ToolTip = 'Add a custom ignore-file in ''.gitignore'' format. These files have a low precedence.'
    }
    @{
        ShortName = '-g'
        FullName  = '--glob'
        ToolTip = 'Glob-based search (default: regular expression)'
        Url = '<link to glob syntax here...>'

    }
    @{
        FullName  = '--regex'
        ToolTip = 'Perform a regular-expression based search (default). This can be used to override
        --glob'
    }
    @{
        ShortName = '-a'
        FullName  = '--absolute-path'
        ToolTip = 'Show absolute instead of relative paths'
        LongHelp= 'Shows the full path starting from the root as opposed to relative paths. The flag can be
        overridden with --relative-path.'

    }
    @{
        FullName  = '--prune'
        ToolTip = 'Do not traverse into directories that match the search criteria. If you want to exclude             specific directories, use the ''--exclude=…'' option'
    }
    @{
        ShortName = '-l'
        FullName  = '--list-details'
        ToolTip = 'Use a long listing format with file metadata'
        LongHelp = '  Use a detailed listing format like ''ls -l''. This is basically an alias for ''--exec-batch
        ls -l'' with some additional ''ls'' options. This can be used to see more metadata, to show
        symlink targets and to achieve a deterministic sort order.'
    }
    @{
        ShortName = '-L'
        FullName  = '--follow'
        ToolTip = 'Follow symbolic links'
        LongHelp = 'By default, fd does not descend into symlinked directories. Using this flag, symbolic
        links are also traversed. Flag can be overriden with --no-follow.'
    }
    @{
        ShortName = '-p'
        FullName  = '--full-path'
        ToolTip = 'Search full abs. path (default: filename only)'
        LongHelp = ' By default, the search pattern is only matched against the filename (or directory name).
        Using this flag, the pattern is matched against the full (absolute) path. Example:
            fd --glob -p ''**/.git/config'''
    }
    @{
        ShortName = '-d'
        FullName  = '--max-depth'
        ToolTip = 'Limit the directory traversal to a given depth. By default, there is no limit on the
            search depth. (default: none)'
        Rest      = ' <depth>'
    }
    @{
        FullName  = '--min-depth'
        ToolTip = 'Only show search results starting at the given depth. See also: ''--max-depth'' and
            ''--exact-depth'''
        Rest      = ' <depth>'
    }
    @{
        FullName  = '--exact-depth'
        ToolTip = 'Only show search results at the exact given depth. This is an alias for ''--min-depth
            <depth> --max-depth <depth>''.'
        Rest      = ' <depth>'
    }
    @{
        ShortName = '-0'
        FullName  = '--print0'
        ToolTip = 'eparate search results by the null character (instead of newlines). Useful for piping
        results to ''xargs''.'
        # Rest      = ' <depth>'
    }
     @{
        ShortName = '-t'
        FullName  = '--type'
        ToolTip = 'Filter by type: file (f), directory (d), symlink (l),
                                       executable (x), empty (e), socket (s), pipe (p)'
        Rest      = ' <filetype>'
        LongHelp = '-t, --type <filetype>
        Filter the search by type:
            ''f'' or ''file'':         regular files
            ''d'' or ''directory'':    directories
            ''l'' or ''symlink'':      symbolic links
            ''s'' or ''socket'':       socket
            ''p'' or ''pipe'':         named pipe (FIFO)

            ''x'' or ''executable'':   executables
            ''e'' or ''empty'':        empty files or directories

        This option can be specified more than once to include multiple file types. Searching
        for ''--type file --type symlink'' will show both regular files as well as symlinks. Note
        that the ''executable'' and ''empty'' filters work differently: ''--type executable'' implies
        ''--type file'' by default. And ''--type empty'' searches for empty files and directories,
        unless either ''--type file'' or ''--type directory'' is specified in addition.

        Examples:
            - Only search for files:
                fd --type file …
                fd -tf …
            - Find both files and symlinks
                fd --type file --type symlink …
                fd -tf -tl …
            - Find executable files:
                fd --type executable
                fd -tx
            - Find empty files:
                fd --type empty --type file
                fd -te -tf
            - Find empty directories:
                fd --type empty --type directory
                fd -te -td'
    }
     @{
        ShortName = '-F'
        FullName  = '--fixed-strings'
        ToolTip = 'Treat the pattern as a literal string instead of a regular expression. Note that this
        also performs substring comparison. If you want to match on an exact filename, consider
        using ''--glob''.'
        Rest      = ' <filetype>'
    }
    @{
        ShortName = '-e'
        FullName  = '--extension'
        ToolTip = 'Filter by file extension'
        Rest      = ' <ext>'
        LongHelp = '(Additionally) filter search results by their file extension. Multiple allowable file
            extensions can be specified.
            If you want to search for files without extension, you can use the regex ''^[^.]+$'' as a
            normal search pattern.'
    }
    @{
        ShortName = '-x'
        FullName  = '--exec'
        ToolTip = 'Execute a command for each search result'
        Rest      = ' <cmd>...'
    }
    @{
        FullName  = '--show-errors'
        ToolTip = 'Enable the display of filesystem errors for situations such as insufficient permissions
            or dead symlinks.'
    }
    @{
        ShortName = '-u'
        FullName  = '--unrestricted'
        ToolTip = 'Perform an unrestricted search, including ignored and hidden files. This is an alias for ''--no-ignore --hidden'' '
    }
    @{
        ShortName = '-X'
        FullName  = '--exec-batch'
        ToolTip = 'Execute the given command once, with all search results as arguments'
        Rest      = ' <placeholder>...'
        LongHelp = @'
-X, --exec-batch <cmd>...
        Execute the given command once, with all search results as arguments.
        One of the following placeholders is substituted bpwdefore the command is executed:
            '{}':   path (of all search results)
            '{/}':  basename
            '{//}': parent directory
            '{.}':  path without file extension
            '{/.}': basename without file extension

        If no placeholder is present, an implicit "{}" at the end is assumed.

        Examples:

            - Find all test_*.py files and open them in your favorite editor:

                fd -g 'test_*.py' -X vim

            - Find all *.rs files and count the lines with "wc -l ...":

                fd -e rs -X wc -l
'@
    }
    @{
        ShortName = '-x'
        FullName  = '--exec'
        ToolTip = 'Execute a command for each search result in parallel. (use --threads=1 for sequential
        command execution). All positional arguments following --exec are considered to be
        arguments to the command - not to fd. It is therefore recommended to place the
        ''-x''/''--exec'' option last '
        Rest      = '<cmd>'
        LongHelp = @'
-x, --exec <cmd>...
        Execute a command for each search result in parallel (use --threads=1 for sequential
        command execution). All positional arguments following --exec are considered to be
        arguments to the command - not to fd. It is therefore recommended to place the
        '-x'/'--exec' option last.
        The following placeholders are substituted before the command is executed:
            '{}':   path (of the current search result)
            '{/}':  basename
            '{//}': parent directory
            '{.}':  path without file extension
            '{/.}': basename without file extension

        If no placeholder is present, an implicit "{}" at the end is assumed.

        Examples:

            - find all *.zip files and unzip them:

                fd -e zip -x unzip

            - find *.h and *.cpp files and run "clang-format -i .." for each of them:

                fd -e h -e cpp -x clang-format -i

            - Convert all *.jpg files to *.png files:

                fd -e jpg -x convert {} {.}.png
'@
    }
    @{
        # ShortName = '-X'
        FullName  = '--path-separator'
        ToolTip = 'default is the OS-specific: separator (''/'' on Unix, ''\'' on Windows)'
        Rest      = '<separator>'
        LongHelp = @'
--path-separator <separator>
    Set the path separator to use when printing file paths. The default is the OS-specific
    separator ('/' on Unix, '\' on Windows).
'@ | tw.Format-NormalizeLineEnding
    }
    @{
        # ShortName = '-X'
        FullName  = '--search-path'
        ToolTip = 'paths to search as an alternative to the positional <path> argument'
        Rest      = '<path>'
        LongHelp = @'
--search-path <search-path>
    Provide paths to search as an alternative to the positional <path> argument. Changes the
    usage to:
        fd [OPTIONS] --search-path <path> --search-path <path2> [<pattern>]
'@ | tw.Format-NormalizeLineEnding
    }
    @{
        FullName  = '--one-file-system'
        ToolTip = 'ensures that it does not descend into a different file system than the one
            it started in. Comparable to the -mount or -xdev filters of find(1).'
        LongHelp      = @'
By default, fd will traverse the file system tree as far as other options dictate. With
            this flag, fd ensures that it does not descend into a different file system than the one
            it started in. Comparable to the -mount or -xdev filters of find(1).
'@ | tw.Format-NormalizeLineEnding
    }
    @{
        FullName  = '--strip-cwd-prefix'
        ToolTip = 'Do not prefix relative paths with ''./'' when piped'
        LongHelp      = @'
By default, relative paths are prefixed with './' when the output goes to a non
            interactive terminal (TTY). Use this flag to disable this behaviour.
'@ | tw.Format-NormalizeLineEnding
    }
    @{
        ShortName = '-E'
        FullName  = '--exclude'
        ToolTip = 'Exclude entries that match the given glob pattern'
        Rest      = ' <pattern>'
        LongHelp = @'
-E, --exclude <pattern>
Exclude files/directories that match the given glob pattern. This overrides any other
ignore logic. Multiple exclude patterns can be specified.

Examples:
    --exclude '*.pyc'
    --exclude node_modules

'@ | tw.Format-NormalizeLineEnding
    }
    @{
        ShortName = '-c'
        FullName  = '--color'
        ToolTip = 'When to use colors: never, *auto*, always'
        Rest      = ' <when>'
    }
    @{
        ShortName = '-j'
        FullName  = '--threads'
        ToolTip = '<num> Set number of threads to use for searching & executing (default: number of available CPU
            cores)'
        Rest      = '<num>'
    }
    @{
        ShortName = '-S'
        FullName  = '--size'
        ToolTip = 'Limit results based on the size of files'
        Rest      = ' <size>'
        LongHelp = @'
-S, --size <size>
Limit results based on the size of files using the format <+-><NUM><UNIT>.
    '+': file size must be greater than or equal to this
    '-': file size must be less than or equal to this
If neither '+' nor '-' is specified, file size must be exactly equal to this.
    'NUM':  The numeric size (e.g. 500)
    'UNIT': The units for NUM. They are not case-sensitive.
Allowed unit values:
    'b':  bytes
    'k':  kilobytes (base ten, 10^3 = 1000 bytes)
    'm':  megabytes
    'g':  gigabytes
    't':  terabytes
    'ki': kibibytes (base two, 2^10 = 1024 bytes)
    'mi': mebibytes
    'gi': gibibytes
    'ti': tebibytes
'@ #| tw.Format-NormalizeLineEnding
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
        LongHelp = @'
--changed-within <date|dur>
    Filter results based on the file modification time. The argument can be provided as a
    specific point in time (YYYY-MM-DD HH:MM:SS) or as a duration (10h, 1d, 35min). If the
    time is not specified, it defaults to 00:00:00. '--change-newer-than' or '--newer' can
    be used as aliases.
    Examples:
        --changed-within 2weeks
        --change-newer-than '2018-10-27 10:00:00'
        --newer 2018-10-27
'@ | tw.Format-NormalizeLineEnding
    }
    @{
        # ShortName = '-V'
        FullName  = '--changed-before'
        ArgType = '<date|dur>'
        ToolTip = 'Filter by file modification time (older than)'
        LongHelp = @'
--changed-before <date|dur>
    Filter results based on the file modification time. The argument can be provided as a
    specific point in time (YYYY-MM-DD HH:MM:SS) or as a duration (10h, 1d, 35min).
    '--change-older-than' or '--older' can be used as aliases.
    Examples:
        --changed-before '2018-10-27 10:00:00'
        --change-older-than 2weeks
        --older 2018-10-27
'@ | tw.Format-NormalizeLineEnding
    }
    @{
        # ShortName = '-V'
        FullName  = '--base-directory'
        ArgType = '<path>'
        ToolTip = 'Change the current working directory of fd to the provided path'
        LongHelp = @'
--base-directory <path>
    Change the current working directory of fd to the provided path. This means that search
    results will be shown with respect to the given base path. Note that relative paths
    which are passed to fd via the positional <path> argument or the '--search-path' option
    will also be resolved relative to this directory.
'@ | tw.Format-NormalizeLineEnding
    }
    @{
        # ShortName = '-V'
        FullName  = '--batch-size'
        ArgType = '<size>'
        ToolTip = 'Maximum number of arguments to pass to the command given with -X'
        LongHelp = @'
--batch-size <size>
    Maximum number of arguments to pass to the command given with -X. If the number of
    results is greater than the given size, the command given with -X is run again with
    remaining arguments. A batch size of zero means there is no limit (default), but note
    that batching might still happen due to OS restrictions on the maximum length of command
    lines.
'@ | tw.Format-NormalizeLineEnding
    }
)

write-warning 'all funcs shhoudl abstract this'
function __generateCompletions_fd {
    # not the cleanest, but generates two records if there is an alias, else 1
    # $GenerationModeNew = $false
    # if ($GenerationModeNew) {
    #     write-warning 'may not quite work yet'
    #     return $__fdCompletionsData | % {
    #         [TWCompletionResult]::new( $_ ).AsCompletionResult()

    #         if ( -not [string]::IsNullOrWhiteSpace( $_.ShortName ) ) {
    #             $hashAlias = [hashtable]::new( $_ )
    #             $hashAlias.FullName = $hashAlias.ShortName
    #             [TWCompletionResult]::new( $hashAlias ).AsCompletionResult()
    #         }
    #     }
    #     return
    # }
    if ($true -or -not $GenerationModeNew -and 'old conversion') {
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

function Register-TypeCompleterCommandFd {
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
