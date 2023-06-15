$error.Count
err -Clear -ShowCount
$Harness = @{
    ImportModeLocal = $true
}

Push-Location -StackName 'db_harness' -Path .
# Import-Module '../TypeWriter' -Force

function .Fmt.Module {
    # visually summarize a module, maybe make a EzFormat
    $Input
    | Join-String {
        $cDim = "${fg:gray30}${bg:gray40}"
        $cBold = "${fg:gray80}${bg:gray20}"
        $cDef =   $PSStyle.Reset # or "${fg:clear}${bg:clear}"

        "${cBold}{0} = {1}${cDef}`n`t${cDim}{2}${cDef}`n" -f @(
            $_.Name
            $_.Version
            $_.Path
        )
    }   | Join-String -os $PSStyle.Reset
}
$importModuleSplat = @{
    DisableNameChecking = $true
    Force               = $true
    PassThru            = $true
    Verbose             = $true
}

if($harness.ImportModeLocal) { # 1] always import local version?
    Import-Module @importModuleSplat -Name './Source/TypeWriter.psd1'
        | .Fmt.Module
} else { # 2] or built version
    $modPath = Join-Path 'H:/data/2023/pwsh/PsModules.Import' 'TypeWriter'
    Import-Module @importModuleSplat -Name $modPath
        | .Fmt.Module
    # Import-Module .\Output\TypeWriter -Force -Verbose -DisableNameChecking -PassThru
    # Import-Module @importModuleSplat -Name (Join-Path '../../PsModules.Import' 'TypeWriter')
}


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

h1 'Config'
$Harness | ft -AutoSize

h1 'List All'
get-module Typewriter -All
    | .Fmt.Module
# | fl

return


$PSStyle.OutputRendering = 'Ansi' # 'Ansi' | 'Host' | 'NoOutput' | 'PlainText'
# . (gi -ea stop 'Examples/foo.ps1')

$Harness = @{
    ImportMode = 'SourcePath' # [ SourcePath | OutputPath ]
    OutputPath = (Join-Path $PSScriptRoot 'Output')
    SourcePath = (Join-Path $PSScriptRoot 'Source')
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
