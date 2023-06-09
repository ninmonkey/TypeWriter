function Test {
    [CmdletBinding()]
    param(
        $foo = 'foo',
        $bar = 'bar',
        $baz = 'baz'
    )

    [System.Management.Automation.CommandMetadata]::new($MyInvocation.MyCommand).Parameters.GetEnumerator() |
        Where-Object { -not $PSBoundParameters.ContainsKey($_.Key) } |
        ForEach-Object { $PSBoundParameters[$_.Key] = $PSCmdlet.SessionState.PSVariable.GetValue($_.Key) }

    $PSBoundParameters
}

Test a b
