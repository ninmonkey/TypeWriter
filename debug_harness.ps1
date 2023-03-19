$error.Count
err -Clear -ShowCount

Import-Module '../TypeWriter' -Force


$PSStyle.OutputRendering = 'Ansi' # 'Ansi' | 'Host' | 'NoOutput' | 'PlainText'
# . (gi -ea stop 'Examples/foo.ps1')

$Harness = @{
    SourcePath = Get-Item (Join-Path $PSScriptRoot 'Source')
    OutputPath = Get-Item (Join-Path $PSScriptRoot 'Output')
    ImportMode = 'SourcePath' # [ SourcePath | OutputPath ]
}
# $Harness.ImportMode = 'OutputPath'
$Harness.CurImportFullpath = (Join-Path $Harness.($Harness.ImportMode) 'TypeWriter')

$Harness.ImportMode = 'OutputPath'
"importing mode: {0}, path:`n`t{1}" -f @(
    $Harness.ImportMode
    $Harness.CurImportFullpath | Join-String -DoubleQuote
) | Write-Warning -wa 'Continue'

Import-Module $Harness.CurImportFullpath -Force -Verbose
# $HarnessExample.CurImportFullpath = (Join-Path $HarnessExample.($HarnessExample.ImportMode) 'TypeWriter')
return


Push-Location -StackName 'harness' -Path $Harness.SourcePath
build -Verbose -ea 'break' # currently this is skippable /w ImportMode == 'SourcePath'
Pop-Location -StackName 'harness'
'run build script here' | Write-Warning -wa 'Continue'

"importing mode: {0}, path:`n`t{1}" -f @(
    $Harness.ImportMode
    $Harness.CurImportFullpath | Join-String -DoubleQuote
) | Write-Warning -wa 'Continue'



Remove-Module 'TypeWriter' -ea ignore
Import-Module $Harness.CurImportFullpath -Force -Verbose
# import-module (Join-Path $Harness.OutputPath 'TypeWriter') -Force
# import-module (Join-Path $Harness.SourcePath 'TypeWriter') -Force

$error.Count
$error
# err -clear

Get-Command -m TypeWriter
| Sort-Object CommandType, Name
| Format-Table Name -GroupBy CommandType

# 'see also: "https://github.com/PoshCode/Pansies/blob/main/Source/Private/_init.ps1"'
Get-Command -m TypeWriter | Sort-Object Verb, Name | Format-Table Verb, Name -AutoSize

hr

get-module importexcel | Tablify.ModuleInfo
