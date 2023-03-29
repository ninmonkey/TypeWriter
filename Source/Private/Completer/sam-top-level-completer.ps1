# New-completion?
# function completers.SamTopLevel {}
# function completions.SamTopLevel {}

function Register-TypeCompleterCommandSamTopLevel {
    <#
    .SYNOPSIS
    wrap completions for Sam Top-Level

    .DESCRIPTION
    from: <https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html>



    .EXAMPLE
    An example

    .NOTES
    General notes
    .LINK
        https://github.com/sharkdp/fd#features
    .LINK
        https://docs.rs/regex/1.0.0/regex/#syntax
    #>

}

$docs = @'

sam build --use-container --parallel --debug --cached --profile Name

'@
class SamBuildCompletion {
    [string]$Name
    [string]$Description
    [string]$ActualCommand
    [string]$SomethingElse
    SamBuildCompletion(
        [string]$Name,
        [string]$Description,
        [string]$ActualCommand,
        [string]$SomethingElse
    ) {
        $this.Name = $Name
        $this.Description = $Description
        $this.ActualCommand = $ActualCommand
        $this.SomethingElse = $SomethingElse
    }
}

function newSamBuildCompletion {
    [CmdletBinding()]
    # [Alias('newSamBuildCompletion')]
    param(
        [string]$Name,
        [string]$Description,
        [string]$ActualCommand,
        [string]$SomethingElse
    )

    return [SamBuildCompletion]::new(
        $Name,
        $Description,
        $ActualCommand,
        $SomethingElse
    )
}

[Collections.Generic.List[Object]]$script:__samCompletions = @(
   newSamBuildCompletion -Name 'build' -Description 'build the project' -ActualCommand 'sam build' -SomethingElse 'something else'
)

function Register-TypeCompleterCommandSamTopLevel {

}


'show'
$script:__samCompletions | Ft -auto
