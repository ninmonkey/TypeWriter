$error.Count
err -Clear -ShowCount

Push-Location -StackName 'db_harness' -Path .
# Import-Module '../TypeWriter' -Force
Import-Module .\Output\TypeWriter -Force -Verbose -DisableNameChecking

$PSStyle.OutputRendering = 'Ansi' # 'Ansi' | 'Host' | 'NoOutput' | 'PlainText'
# . (gi -ea stop 'Examples/foo.ps1')

$Harness = @{
    SourcePath = (Join-Path $PSScriptRoot 'Source')
    OutputPath = (Join-Path $PSScriptRoot 'Output')
    ImportMode = 'SourcePath' # [ SourcePath | OutputPath ]
}
# $Harness.ImportMode = 'OutputPath'
# $Harness.CurImportFullpath = (Join-Path $Harness.($Harness.ImportMode) 'TypeWriter')
# impo (Join-Path $Harness.OutputPath TypeWriter) -Force -Verbose
# either. same thing.
# impo (Join-Path $Harness.OutputPath TypeWriter) -Force -Verbose


$Harness.ImportMode = 'OutputPath'
"importing mode: {0}, path:`n`t{1}" -f @(
    $Harness.ImportMode
    $Harness.CurImportFullpath | Join-String -DoubleQuote
) | Write-Warning -wa 'Continue'


# Import-Module $Harness.CurImportFullpath -Force -Verbose
# $HarnessExample.CurImportFullpath = (Join-Path $HarnessExample.($HarnessExample.ImportMode) 'TypeWriter')
# remove-module 'TypeWriter' -ea ignore
'available'
Get-Command -m TypeWriter -ListImported -All
# | Ft
| Sort-Object -Unique { $_.Name, $_.Source }
| Sort-Object Source, Name, CommandType
| Format-Table -AutoSize

'imported'
Get-Command -m TypeWriter -ListImported
# | Ft
| Sort-Object -Unique { $_.Name, $_.Source }
| Sort-Object Source, Name, CommandType
| Format-Table -AutoSize


<# see?
    <file:///H:\data\2023\pwsh\PsModules\TypeWriter\Source\Private\Completer\sam-top-level-completer.ps1>
    <file:///H:\data\2023\pwsh\PsModules\TypeWriter\debug_harness.ps1>

therefore
. 'H:\data\2023\pwsh\PsModules\TypeWriter\Source\Private\Completer\sam-top-level-completer.ps1'
#>



Pop-Location -StackName 'db_harness' ; return
































# Push-Location -StackName 'harness' -Path $Harness.SourcePath
# build -Verbose -ea 'break' # currently this is skippable /w ImportMode == 'SourcePath'
# Pop-Location -StackName 'harness'
# 'run build script here' | Write-Warning -wa 'Continue'

# "importing mode: {0}, path:`n`t{1}" -f @(
#     $Harness.ImportMode
#     $Harness.CurImportFullpath | Join-String -DoubleQuote
# ) | Write-Warning -wa 'Continue'



# Remove-Module 'TypeWriter' -ea ignore
# Import-Module $Harness.CurImportFullpath -Force -Verbose
# # import-module (Join-Path $Harness.OutputPath 'TypeWriter') -Force
# # import-module (Join-Path $Harness.SourcePath 'TypeWriter') -Force

# $error.Count
# $error
# # err -clear

# Get-Command -m TypeWriter
# | Sort-Object CommandType, Name
# | Format-Table Name -GroupBy CommandType

# # 'see also: "https://github.com/PoshCode/Pansies/blob/main/Source/Private/_init.ps1"'
# Get-Command -m TypeWriter | Sort-Object Verb, Name | Format-Table Verb, Name -AutoSize

# Hr

# Get-Module importexcel | Tablify.ModuleInfo


# Pop-Location -StackName 'db_harness'
