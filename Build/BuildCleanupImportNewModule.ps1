function CleanRebuild.TypeWriter {
    '::CleanRebuild.TypeWriter => enter'
    | Write-Host -fore blue

    'H:\data\2023\pwsh\PsModules\TypeWriter\Output'
    | Join-String -f '::Remove: /Output: {0}:'
    | Write-Host -fore blue

    rm -Recurse -Force 'H:\data\2023\pwsh\PsModules\TypeWriter\Output'


    pushd -Path 'H:\data\2023\pwsh\PsModules\TypeWriter\Source'
    gci

    'H:\data\2023\pwsh\PsModules\TypeWriter\Source'
    | Join-String -f '::build: /Source: {0}:'
    | Write-Host -fore blue

    build
    #popd
    #import-module 'H:\data\2023\pwsh\PsModules\TypeWriter\Output' -verb -PassThru
    impo ( Get-Module TypeWriter -ListAvailable | % Path) -Verbose -Force -PassThru

    ( Get-Module TypeWriter -ListAvailable | % Path)
    | Join-String -f '::Import -force: {0}:'
    | Write-Host -fore blue

    pwd | RenderLongPathNames
    gcm -m TypeWriter | ft
    '::CleanRebuild.TypeWriter => end'
    | Write-Host -fore blue
}
CleanRebuild.TypeWriter
