# Run and Dump
This script will run a provided program, along with any required arguments, 
for a specified sleep period in seconds (or for 10 seconds if omitted), 
and write to a specified dumpFile (or use the procdump defaults if omitted).

## Parameters:
* program: The program to run
* params: The string that represents the program arguments
* sleepTime: The duration (in seconds) to sleep. Defaults to 10 if omitted
* dumpFile: The filePath to write the dump file to. Uses procdump defaults if omitted.

## Examples:
#### Powershell Session
```
runAndDump.ps1 -program node -params run.js -sleepTime 30 -dumpFile crazyAwesomeBinaryDump.dmp
```


#### Command Prompt (cmd.exe)
```
Powershell -File runAndDump.ps1 -program node -params run.js -sleepTime 30 -dumpFile crazyAwesomeBinaryDump.dmp
```

**NOTE**: If your system doesn't allow execution of Powershell scripts by default, you can bypass this (with administrative rights) by running like so:
```
Powershell -ExecutionPolicy Bypass -File runAndDump.ps1 -program node -params run.js -sleepTime 30 -dumpFile crazyAwesomeBinaryDump.dmp
```