# Parameter Defs
param(
	$program,
    $dumpFile,
	$params,
    $sleepTime
)

function dump($processId, [string]$path = ""){
    $procDumpArgs = "$processId -accepteula -ma -r -a"
    if ($path -ne ""){
        $procDumpArgs += $path
    }
    Start-Process procdump -ArgumentList $procDumpArgs -NoNewWindow -Wait
}


if (!$program){
    Write-Output "You must specify the program argument!"
    exit
}

if (!$sleepTime){
    $sleepTime = 10
}


if ($params){
    $proc = Start-Process $program -ArgumentList $params.split() -PassThru
}
else{
    $proc = Start-Process $program -PassThru
}

Write-Output "Process ID: " $proc.Id
Write-Output "Sleeping for $sleepTime seconds..."
Start-Sleep -s $sleepTime
Write-Output "Executing dump..."
if ($dumpFile){
    dump($proc.Id, $dumpFile)
}
else{
    Write-Output "Warning: No dump file path was given, using defaults..."
    dump($proc.Id)
}
Write-Output "Dump complete, kill process."
$proc.Kill()
Write-Output "Done!"

