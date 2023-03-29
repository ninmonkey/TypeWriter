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
## Related docs

- [Namespace S.M.A.](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation?view=powershellsdk-7.0.0)
- [ArgumentCompletions](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.argumentcompletionsattribute?view=powershellsdk-7.0.0)
