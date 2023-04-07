## TypeWriter 


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

## Related Types

- [Namespace S.M.A.](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation?view=powershellsdk-7.0.0)
  - [CachedValidValuesGeneratorBase](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cachedvalidvaluesgeneratorbase?view=powershellsdk-7.0.0)
    - Optional base class for `[IValidateSetValuesGenerator]` implementations that want a default implementation to cache valid values. 
  - [ArgumentCompletions](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.argumentcompletionsattribute?view=powershellsdk-7.0.0)
  - [CompletionCompleters](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.completioncompleters?view=powershellsdk-7.0.0)
  - [FunctionInfo](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.functioninfo?view=powershellsdk-7.0.0)
  - [InvocationInfo](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.invocationinfo?view=powershellsdk-7.0.0)
  - [LocationChangedEventArgs](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.locationchangedeventargs?view=powershellsdk-7.0.0)
  - [InformationRecord](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.informationrecord?view=powershellsdk-7.0.0)


## maybe check out ?
  - [CustomEntryBuilder](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.customentrybuilder?view=powershellsdk-7.0.0)
  - [EntrySelectedBy](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.entryselectedby?view=powershellsdk-7.0.0) Each control (table, list, wide, or custom) may have multiple entries. If there are multiple entries, there must be a default entry with no condition, all other entries must have EntrySelectedBy specified. This is useful when you need a single view for grouping or otherwise just selecting the shape of formatting, but need distinct formatting rules for each instance. For example, when listing files, you may want to group based on the parent path, but select different entries depending on if the item is a file or directory.


## `[CompletionResultType]` Values



   ReflectedType: System.Management.Automation.CompletionResultType

Name              MemberType Definition
----              ---------- ----------
Command           Field      public const CompletionResultType Command = 2;
DynamicKeyword    Field      public const CompletionResultType DynamicKeyword = 13;
History           Field      public const CompletionResultType History = 1;
Keyword           Field      public const CompletionResultType Keyword = 12;
Method            Field      public const CompletionResultType Method = 6;
Namespace         Field      public const CompletionResultType Namespace = 10;
ParameterName     Field      public const CompletionResultType ParameterName = 7;
ParameterValue    Field      public const CompletionResultType ParameterValue = 8;
Property          Field      public const CompletionResultType Property = 5;
ProviderContainer Field      public const CompletionResultType ProviderContainer = 4;
ProviderItem      Field      public const CompletionResultType ProviderItem = 3;
Text              Field      public const CompletionResultType Text = 0;
Type              Field      public const CompletionResultType Type = 11;
value__           Field      public int value__;
Variable          Field      public const CompletionResultType Variable = 9;

 

