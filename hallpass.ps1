<#

Craig Millsap
2/2022

Simple Script for only uploading students for HallPass

#>

$currentPath=(Split-Path ((Get-Variable MyInvocation -Scope 0).Value).MyCommand.Path)

if (-Not(Test-Path $currentPath\hallpass)) { New-Item -ItemType Directory hallpass }
if (-Not(Test-Path $currentPath\files)) { New-Item -ItemType Directory files }

if (-Not(Test-Path .\settings.ps1)) {
    Write-Host "Error: Failed to find settings.ps1 file."    
    exit 1
} else {
    . .\settings.ps1
}

if (-Not($authorizationFile = Get-ChildItem -Filter *.ud -Recurse | Select-Object -First 1 -ExpandProperty FullName)) {
    Write-Host "Error: Authorization File not found in any directory here. Please save the .ud file to this directory."
    exit 1
}

..\CognosDownload.ps1 -report students -teamcontent -cognosfolder "_Shared Data File Reports\HallPass" -savepath .\files

$students = Import-CSV .\files\students.csv | Where-Object { $validbuildings -contains $PSItem.'school id' }

if ($removeHomeroomTeachers) {
    $students = $students | Select-Object -ExcludeProperty teacher | Select-Object *,teacher
}

#There has to be valid data before we continue.
if ($students.Count -ge 1) {
    $students | Export-CSV -Path .\hallpass\students.sd -Delimiter '|' -Force -UseQuotes AsNeeded
} else {
    Write-Host "Error: There are no students to process. Please check your settings.ps1 file and that you have the proper buildings specified."
    exit 1
}

Compress-Archive -LiteralPath .\hallpass\students.sd,$authorizationFile -CompressionLevel Optimal -DestinationPath ".\hallpass\$($filename)" -Force

#Later add upload code here.