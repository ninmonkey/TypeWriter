
- [ ] stuff

## see also

- https://github.com/PoshCode/ModuleBuilder
- https://github.com/Jaykul/TerminalBlocks/blob/main/build.psd1

## SubCommands, or Parameters that have no arguments

todo: allow sub commands using a tree structure

- Example of variation using minimal command with subcommands 
- Good first test case, because it has no overlapping arguments
  - ie: only the sub command and its args are ever used
  - no top level like --verbose that would work on multiple, adding a tree requirement

```ps1
github clone url
github clone url --branch branchName
github <path>
github open <path>
```

## ask

```ps1
'can I get completions to act as a pass-thru 
   like % and ?  can? ex'

# completes
    gcm -m ImportExcel 
    #| CountOf
    | ?{ $true } 
    | ?{ $_.<menuComplete>

# cannot complete
    gcm -m ImportExcel 
    | CountOf    
    | ?{ $_.<menuComplete>
```
