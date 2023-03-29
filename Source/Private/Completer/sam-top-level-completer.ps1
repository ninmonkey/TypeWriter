# New-completion?
# function completers.SamTopLevel {}
# function completions.SamTopLevel {}

function Register-TypeCompleterCommandSamTopLevel {
    <#
    .SYNOPSIS
    wrap completions for Fd Search

    .DESCRIPTION
    from <https://github.com/sharkdp/fd#features>

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

@'
important

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
