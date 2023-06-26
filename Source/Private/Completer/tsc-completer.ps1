<# templateFrom: 2023-06-24
tsc

    - [cli args, TypeScript handbook](https://www.typescriptlang.org/docs/handbook/compiler-options.html)
    - [compiler options: tsconfig.json](https://www.typescriptlang.org/tsconfig)
    - [Configuring Tsc Watch](https://www.typescriptlang.org/docs/handbook/configuring-watch.html)

USAGE:
    # Run a compile based on a backwards look through the fs for a tsconfig.json
    tsc

    # Emit JS for just the index.ts with the compiler defaults
    tsc index.ts

    # Emit JS for any .ts files in the folder src, with the default settings
    tsc src/*.ts

    # Emit files referenced in with the compiler settings from tsconfig.production.json
    tsc --project tsconfig.production.json

    # Emit d.ts files for a js file with showing compiler options which are booleans
    tsc index.js --declaration --emitDeclarationOnly

    # Emit a single .js file from two files via compiler options which take string arguments
    tsc app.ts util.ts --target esnext --outfile index.js
#>
$script:__tscCompletionsData = @(
    # future: Type coerces into
    @{
        ShortName = '-h'
        FullName  = '--help'
        ToolTip   = 'Print help information. <https://www.typescriptlang.org/docs/handbook/compiler-options.html>'
        LongHelp = '
scrapped key names from copying from <https://www.typescriptlang.org/docs/handbook/compiler-options.html>
then used a regex to select all keys:
    $regexKeys = "^-+([-\w]{1,})"



tsc
    [cli args, TypeScript handbook](https://www.typescriptlang.org/docs/handbook/compiler-options.html)
    [compiler options: tsconfig.json](https://www.typescriptlang.org/tsconfig)
    - [Configuring Tsc Watch](https://www.typescriptlang.org/docs/handbook/configuring-watch.html)

USAGE:
    # Run a compile based on a backwards look through the fs for a tsconfig.json
    tsc

    # Emit JS for just the index.ts with the compiler defaults
    tsc index.ts

    # Emit JS for any .ts files in the folder src, with the default settings
    tsc src/*.ts

    # Emit files referenced in with the compiler settings from tsconfig.production.json
    tsc --project tsconfig.production.json

    # Emit d.ts files for a js file with showing compiler options which are booleans
    tsc index.js --declaration --emitDeclarationOnly

    # Emit a single .js file from two files via compiler options which take string arguments
    tsc app.ts util.ts --target esnext --outfile index.js
'
    }
    # @{
    #     ShortName = '-H'
    #     FullName  = '--hidden'
    #     Tooltip   = 'Search hidden files and directories'

#         LongHelp  = @'
# -H, --hidden
#         Include ...
#         director...
#         name sta...
# '@
#     }
#     @{
#         # ShortName = '-X'
#         FullName = '--search-path'
#         ToolTip  = 'paths to search as an alternative to the positional <path> argument'
#         Rest     = '<path>'
#         LongHelp = @'
# --search-path <search-path>
# Provide paths to search as an alternative to the positional <path> argument. Changes
#         tsc [OPTIONS] --search-path <path> --search-path <path2> [<pattern>]
# '@ | tw.Format-NormalizeLineEnding
#     }
    @{
        FullName = '--all'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--generateTrace'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--help'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--init'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--listFilesOnly'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--locale'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--project'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--showConfig'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--version'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--build'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--clean'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--dry'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--force'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--verbose'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--excludeDirectories'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--excludeFiles'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--fallbackPolling'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--synchronousWatchDirectory'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--watch'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--watchDirectory'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--watchFile'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--allowArbitraryExtensions'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--allowImportingTsExtensions'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--allowJs'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--allowSyntheticDefaultImports'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--allowUmdGlobalAccess'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--allowUnreachableCode'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--allowUnusedLabels'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--alwaysStrict'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--assumeChangesOnlyAffectDirectDependencies'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--baseUrl'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--charset'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--checkJs'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--composite'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--customConditions'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--declaration'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--declarationDir'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--declarationMap'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--diagnostics'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--disableReferencedProjectLoad'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--disableSizeLimit'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--disableSolutionSearching'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--disableSourceOfProjectReferenceRedirect'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--downlevelIteration'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--emitBOM'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--emitDeclarationOnly'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--emitDecoratorMetadata'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--esModuleInterop'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--exactOptionalPropertyTypes'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--experimentalDecorators'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--explainFiles'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--extendedDiagnostics'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--forceConsistentCasingInFileNames'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--generateCpuProfile'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--importHelpers'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--importsNotUsedAsValues'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--incremental'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--inlineSourceMap'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--inlineSources'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--isolatedModules'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--jsx'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--jsxFactory'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--jsxFragmentFactory'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--jsxImportSource'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--keyofStringsOnly'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--lib'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--listEmittedFiles'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--listFiles'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--mapRoot'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--maxNodeModuleJsDepth'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--module'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--moduleDetection'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--moduleResolution'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--moduleSuffixes'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--newLine'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noEmit'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noEmitHelpers'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noEmitOnError'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noErrorTruncation'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noFallthroughCasesInSwitch'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noImplicitAny'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noImplicitOverride'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noImplicitReturns'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noImplicitThis'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noImplicitUseStrict'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noLib'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noPropertyAccessFromIndexSignature'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noResolve'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noStrictGenericChecks'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noUncheckedIndexedAccess'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noUnusedLocals'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--noUnusedParameters'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--out'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--outDir'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--outFile'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--paths'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--plugins'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--preserveConstEnums'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--preserveSymlinks'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--preserveValueImports'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--preserveWatchOutput'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--pretty'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--reactNamespace'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--removeComments'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--resolveJsonModule'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--resolvePackageJsonExports'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--resolvePackageJsonImports'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--rootDir'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--rootDirs'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--skipDefaultLibCheck'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--skipLibCheck'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--sourceMap'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--sourceRoot'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--strict'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--strictBindCallApply'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--strictFunctionTypes'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--strictNullChecks'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--strictPropertyInitialization'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--stripInternal'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--suppressExcessPropertyErrors'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--suppressImplicitAnyIndexErrors'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--target'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--traceResolution'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--tsBuildInfoFile'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--typeRoots'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--types'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--useDefineForClassFields'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--useUnknownInCatchVariables'
        ToolTip = 'nyi'
    }
    @{
        FullName = '--verbatimModuleSyntax'
        ToolTip = 'nyi'
    }
)

function __generateCompletions_tsc {
    # not the cleanest, but generates two records if there is an alias, else 1
    # $GenerationModeNew = $false
    # if ($GenerationModeNew) {
    #     write-warning 'may not quite work yet'
    #     return $__tscCompletionsData | % {
    #         [TWCompletionResult]::new( $_ ).AsCompletionResult()

    #         if ( -not [string]::IsNullOrWhiteSpace( $_.ShortName ) ) {
    #             $hashAlias = [hashtable]::new( $_ )
    #             $hashAlias.FullName = $hashAlias.ShortName
    #             [TWCompletionResult]::new( $hashAlias ).AsCompletionResult()
    #         }
    #     }
    #     return
    # }

    return $script:__tscCompletionsData | % {
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

function Register-TypeCompleterCommandtsc {
    <#
    .SYNOPSIS
        completions to 'tsc'
    .DESCRIPTION

    .NOTES
    future:
        - [ ] stuff

    .EXAMPLE
        Register-TypeCompleterCommandtsc

    #>
    $cmdScriptBlock = {
        param($wordToComplete, $commandAst, $cursorPosition)

        return [Collections.Generic.List[Object]]$GeneratedCompletions = @(
            __generateCompletions_tsc
        ) | Sort-Object CompletionText
    }
    Register-ArgumentCompleter -Native -CommandName 'tsc' -ScriptBlock $cmdScriptBlock
}
