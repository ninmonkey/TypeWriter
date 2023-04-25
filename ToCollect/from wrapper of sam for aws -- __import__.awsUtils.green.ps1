$script:AwsWrapConfig = @{
    Log = @{
        Root = 'e:\aws_build\bdg2\logs'
    }
}
function awsWrap.EnsureFileExists {
    param (
        [Parameter(Mandatory)]
        [string]$Targetpath
    )
    $item = Get-Item -ea 'ignore' $Targetpath
    $item ??= New-Item -ItemType File -Path $TargetPath
    'ensureExists: {0}' -f @( $item ) | Write-Verbose
    return $item
}

$AwsWrapConfig.Log.Shared = awsWrap.EnsureFileExists -verbose (Join-Path $AwsWrapConfig.Log.Root 'shared.log')





function awsWrap.Sam.CopyLocal {
    <#
    .synsopsis
        copies BDGLib to the aws build directory
    #>
    [CmdletBinding()]
    param()
    $Paths = @{
        Build_PsModulesDir       = Get-Item -force -ea stop 'H:\data\client_bdg\2023.03.17-bdg\core\src\pass1\lab-lambda-runtime\examples\demo-runtime-layer-function\.aws-sam\build\DemoAWSToolsLayer\modules'
        # Build_Source_ImportExcel = 'H:\data\client_bdg\2023.03.17-bdg\core\src\pass1\lab-lambda-runtime\powershell-modules\ImportExcel'
        # Build_Source_JC          = Get-Item -force -ea ignore 'H:\data\client_bdg\aws\mini-lambda\simple-awsLambda\serverless-patterns\lambda-powershell-runtime-sam\function\JumpCloud'
    }

    $ModulesToLocalCopy = Get-ChildItem 'H:\data\client_bdg\aws\mini-lambda\simple-awsLambda\serverless-patterns\lambda-powershell-runtime-sam\function' -Directory | Sort-Object -Unique | Where-Object -Not {
        $_.Name -match
        'JumpCloud.*' -or
        $_.Name -match
        'bdg_lib|ImportExcel|Posh-Ssh'

    }
    $ModulesToLocalCopy | Join-String -op "CopyLocalModules:`n - " -sep "`n - " -SingleQuote | Write-Information -infa 'continue'
    'Copy to: {0}' -f @(
        $Paths.Build_PsModulesDir
    )
    foreach ($Source in $ModulesToLocalCopy) {
        '::CopyLocalModule:: = {0}' -f @(
            $Source | Split-Path -Leaf
        ) | Out-Host
        Copy-Item $Source -Destination $Paths.Build_PsModulesDir -ea 'ignore' -Recurse 3>$null
        | Write-Debug
    }

    # change icon, as a quick confirmation as a visual guid for log outputs
    $srcTarget = Get-Item 'H:\data\client_bdg\2023.03.17-bdg\core\src\pass1\lab-lambda-runtime\examples\demo-runtime-layer-function\.aws-sam\build\DemoPowerShellFunction\examplehandler.ps1'

    [string]$randRune = '🐈🐶📌🐱🍴🦎🐀🧑👍🐇🐪🧪🏃‍♂️🦈🤖🐜'.EnumerateRunes()
    | ForEach-Object { $_ }
    | Get-Random -Count 1
    # |CountOf

    $content = (Get-Content $srcTarget -Raw)
    $content = $Content -replace 'green🟢', $RandRune
    $content
    | Set-Content $srcTarget -Encoding 'utf8' -Verbose -PassThru

    # $ModulesToLocalCopy | Join-String -op 'CopyLocalModules: ' -sep ', ' -SingleQuote | Write-Verbose

}
function awsWrap.Sam.Build {
    <#
    .synopsis
        wraps native command 'sam', specifically 'build'
    .notes
        future: maybe commands based on sub commands
        meaning try ugit's piecemeal modules
    .example
        awsWrap.Sam.Build -Template 'foo.yml'
    #>
    [CmdletBinding()]
    param (


        # sam's arg: --template-file
        [Parameter()]
        [string]$TemplateFile,

        [hashtable]$Options = @{}

    )

    $Config = mergeHash -Other $Options -BaseHash @{
        Log         = $AwsWrapConfig.Log.Shared  #  $AwsWrapConfig.Log.Shared  # awsWrap.EnsureFileExists
        enableDebug = $true
        Build       = @{
            AlwaysGotoTemplatePath = $true
        }
    }
    $COnfig | ConvertTo-Json -Depth 1 -Compress | Write-Verbose
    if ($Config.Build.AlwaysGotoTemplatePath) {
        Goto $TemplateFile
        'jumped to: {0}' -f @(
            Get-Item .
        )
    }

    [Collections.Generic.List[Object]]$SamArgs = @(
        'build'
        '--parallel', '--use-container'
        '--skip-pull-image'
        '--profile', 'BDG'
        if ($False) { '--exclude', 'TEXT' }
        if ($false) { '--region', 'us-east-1' }
        if ($Config.enableDebug) { '--debug' }
        if ($TemplateFile) {
            '--template-file'
            Get-Item -ea 'stop' $TemplateFile
        }
        '--cached' # '--cached' | '--no-cached'
        '--cache-dir'
        (Get-Item -ea 'stop' 'E:\aws_build\bdg2\cache-dir')
        '--build-dir'
        (Get-Item -ea 'stop' 'E:\aws_build\bdg2\build-dir')
    )

    $SamArgs | Join-String -op 'invoke: sam => ' -sep ' '

    & sam @SamArgs
    | ForEach-Object {
        $cPrefix = @(
            $PSStyle.Background.FromRgb('#339922')
        ) -join ''

        $cSuffix = $PSStyle.Reset

        $fullPrefix = '{0}::{1}::{2}' -f @(
            $cPrefix
            'Build'
            $cSuffix
        )
        $_ | Join-String -op $FullPrefix -os $PSStyle.reset
    }
    | Add-Content -Path $Config.Log -PassThru

    New-BurntToastNotification -Text 'finished: 🟢 sam Build'
}

function awsWrap.Sam.Deploy {
    <#
    .notes

    Set SAM_CLI_POLL_DELAY Environment Variable with a value of seconds in your shell to configure
    how often SAM CLI checks the Stack state, which is useful when seeing throttling from CloudFormation.

    e.g. sam deploy --template-file packaged.yaml --stack-name sam-app --capabilities CAPABILITY_IAM
    #>
    [CmdletBinding()]
    param (
        # sam's arg: --template-file
        [Parameter()]
        [string]$TemplateFile,
        [ArgumentCompletions('samp-app')]
        [string]$StackName,

        [argumentCompletions(
            'CAPABILITY_IAM'
            # 'CAPABILITY_NAMED_IAM'
        )]
        [string]$Capabilities,

        [Alias('NoExecuteChangeSet')]
        [switch]$WhatIf,

        [hashtable]$Options = @{}

    )

    $Config = mergeHash -Other $Options -BaseHash @{
        Log         = $AwsWrapConfig.Log.Shared  #  $AwsWrapConfig.Log.Shared  # awsWrap.EnsureFileExists
        enableDebug = $true
        Deploy      = @{
            AlwaysGotoTemplatePath = $true
        }
    }
    $COnfig | ConvertTo-Json -Depth 3 -Compress | Write-Verbose

    if ($Config.Build.AlwaysGotoTemplatePath) {
        Goto $TemplateFile
        'jumped to: {0}' -f @(
            Get-Item .
        )
    }

    [Collections.Generic.List[Object]]$SamArgs = @(
        'deploy'
        if ($TemplateFile) {
            '--template-file'
            Get-Item -ea 'stop' $TemplateFile

        }
        if ($Config.enableDebug) { '--debug' }
        if ( $StackName ) {
            '--stack-name'
            $StackName
        }
        if ($Capabilities) {
            '--capabilities'
        }
        if ($WhatIf) {
            '--no-execute-changeset'
        }

        if ($false) {

            '--no-execute-changeset'
            '--fail-on-empty-changeset | --no-fail-on-empty-changeset'
            '--confirm-changeset | --no-confirm-changeset'
            '--disable-rollback | --no-disable-rollback'

            <#
            failure
            #>
            '-on-failure [ROLLBACK|DELETE|DO_NOTHING]'
            <#
            failure
This option is mutually exclusive with
                                  --disable-rollback/--no-disable-rollback.
                                  You can provide --on-failure or --disable-
                                  rollback/--no-disable-rollback but not both
                                  at the same time.
            #>

            # for should Process
            '--confirm-changeset', '--no-confirm-changeset'
            # 'the rest'
            '--config-env', 'TEXT'
            '--config-file', 'TEXT'
            '--guided'
            # '--template-file', '--template-path' # same?
            <#
            --fail-on-empty-changeset / --no-fail-on-empty-changeset
                Specify  if  the CLI should return a non-
                zero exit code if there are no changes to be
                made to the stack. The default behavior is
                to return a non-zero exit code.
            #>

        }


        ### args from build
        #     'build'
        #     '--parallel', '--use-container'
        #     '--skip-pull-image'
        #     '--profile', 'BDG'
        #     if ($False) { '--exclude', 'TEXT' }
        #     if ($false) { '--region', 'us-east-1' }
        #     if ($Config.enableDebug) { '--debug' }
        #     if ($TemplateFile) {
        #         '--template-file'
        #         Get-Item -ea 'stop' $TemplateFile
        #     }
        #     '--cached' # '--cached' | '--no-cached'
        #     '--cache-dir'
        # (Get-Item -ea 'stop' 'E:\aws_build\bdg2\cache-dir')
        #     '--build-dir'
        # (Get-Item -ea 'stop' 'E:\aws_build\bdg2\build-dir')
        # )

        $SamArgs | Join-String -op 'invoke: sam => ' -sep ' '

        & sam @SamArgs
        | ForEach-Object {
            $cPrefix = @(
                $PSStyle.Background.FromRgb('#339922')
            ) -join ''

            $cSuffix = $PSStyle.Reset

            $fullPrefix = '{0}::{1}::{2}' -f @(
                $cPrefix
                'Deploy'
                $cSuffix
            )
            # $_ | Join-String -op $FullPrefix
            $_ | Join-String -op $FullPrefix -os $PSStyle.reset
        }
        | Add-Content -Path $Config.Log -PassThru

        New-BurntToastNotification -Text 'finished: 🟢 sam Deploy'
    )
}