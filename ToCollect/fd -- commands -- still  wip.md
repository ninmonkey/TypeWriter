## todo: finish adding to 

- <file:///H:\data\2023\pwsh\PsModules.dev\TypeWriter\Source\Private\Completer\fd-completer.ps1>


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

OPTIONS:
    -H, --hidden
            Include hidden directories and files in the search results (default: hidden files and
            directories are skipped). Files and directories are considered to be hidden if their
            name starts with a `.` sign (dot). The flag can be overridden with --no-hidden.

    -I, --no-ignore
            Show search results from files and directories that would otherwise be ignored by
            '.gitignore', '.ignore', '.fdignore', or the global ignore file. The flag can be
            overridden with --ignore.

        --no-ignore-vcs
            Show search results from files and directories that would otherwise be ignored by
            '.gitignore' files. The flag can be overridden with --ignore-vcs.

        --no-ignore-parent
            Show search results from files and directories that would otherwise be ignored by
            '.gitignore', '.ignore', or '.fdignore' files in parent directories.

    -u, --unrestricted
            Perform an unrestricted search, including ignored and hidden files. This is an alias for
            '--no-ignore --hidden'.

    -s, --case-sensitive
            Perform a case-sensitive search. By default, fd uses case-insensitive searches, unless
            the pattern contains an uppercase character (smart case).

    -i, --ignore-case
            Perform a case-insensitive search. By default, fd uses case-insensitive searches, unless
            the pattern contains an uppercase character (smart case).

    -g, --glob
            Perform a glob-based search instead of a regular expression search.

        --regex
            Perform a regular-expression based search (default). This can be used to override
            --glob.

    -F, --fixed-strings
            Treat the pattern as a literal string instead of a regular expression. Note that this
            also performs substring comparison. If you want to match on an exact filename, consider
            using '--glob'.

    -a, --absolute-path
            Shows the full path starting from the root as opposed to relative paths. The flag can be
            overridden with --relative-path.

    -l, --list-details
            Use a detailed listing format like 'ls -l'. This is basically an alias for '--exec-batch
            ls -l' with some additional 'ls' options. This can be used to see more metadata, to show
            symlink targets and to achieve a deterministic sort order.

    -L, --follow
            By default, fd does not descend into symlinked directories. Using this flag, symbolic
            links are also traversed. Flag can be overriden with --no-follow.

    -p, --full-path
            By default, the search pattern is only matched against the filename (or directory name).
            Using this flag, the pattern is matched against the full (absolute) path. Example:
              fd --glob -p '**/.git/config'

    -0, --print0
            Separate search results by the null character (instead of newlines). Useful for piping
            results to 'xargs'.

    -d, --max-depth <depth>
            Limit the directory traversal to a given depth. By default, there is no limit on the
            search depth.

        --min-depth <depth>
            Only show search results starting at the given depth. See also: '--max-depth' and
            '--exact-depth'

        --exact-depth <depth>
            Only show search results at the exact given depth. This is an alias for '--min-depth
            <depth> --max-depth <depth>'.

        --prune
            Do not traverse into directories that match the search criteria. If you want to exclude
            specific directories, use the '--exclude=…' option.

    -t, --type <filetype>
            Filter the search by type:
              'f' or 'file':         regular files
              'd' or 'directory':    directories
              'l' or 'symlink':      symbolic links
              's' or 'socket':       socket
              'p' or 'pipe':         named pipe (FIFO)
            
              'x' or 'executable':   executables
              'e' or 'empty':        empty files or directories
            
            This option can be specified more than once to include multiple file types. Searching
            for '--type file --type symlink' will show both regular files as well as symlinks. Note
            that the 'executable' and 'empty' filters work differently: '--type executable' implies
            '--type file' by default. And '--type empty' searches for empty files and directories,
            unless either '--type file' or '--type directory' is specified in addition.
            
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
                  fd -te -td

    -e, --extension <ext>
            (Additionally) filter search results by their file extension. Multiple allowable file
            extensions can be specified.
            If you want to search for files without extension, you can use the regex '^[^.]+$' as a
            normal search pattern.



Note: `fd -h` prints a short and concise overview while `fd --help` gives all details.
