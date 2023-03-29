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
