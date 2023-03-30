## TypeWriter 

```PipeScript{

### All
Get-Command -m TypeWriter -ListImported -All
# | Ft
| Sort-Object -Unique { $_.Name, $_.Source }
| Sort-Object Source, Name, CommandType
| Format-Table -AutoSize

### List Imported
Get-Command -m TypeWriter -ListImported
# | Ft
| Sort-Object -Unique { $_.Name, $_.Source }
| Sort-Object Source, Name, CommandType
| Format-Table -AutoSize

}
```
<!-- 
<insert: generate commands here>
- <https://github.com/StartAutomating/PipeScript/blob/main/docs/ListOfTranspilers.md>

-->

## Related Links

- [Working-Argument-Transformations vexx](https://vexx32.github.io/2018/12/13/Working-Argument-Transformations)
- [about_PSReadLine_functions](https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline_functions?view=powershell-7.3)
- [about_PSReadLine](https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline_functions?view=powershell-7.3)
## Related docs

- [PSReadline Sample Profile Scripts](https://github.com/PowerShell/PSReadLine/blob/master/PSReadLine/SamplePSReadLineProfile.ps1#L585-L602)
- [Namespace S.M.A.](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation?view=powershellsdk-7.0.0)
- [ArgumentCompletions](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.argumentcompletionsattribute?view=powershellsdk-7.0.0)
