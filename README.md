# HallPass Student File

These scripts come without warranty of any kind. Use them at your own risk. I assume no liability for the accuracy, correctness, completeness, or usefulness of any information provided by this site nor for any sort of damages using these scripts may cause.

This script does not do incremental uploads. It is a complete upload once a day.

The final ZIP file will be named the same as the .ud authorization file you are provided by HallPass.  For student uploads it will have an 's' appended to the end.

## Suggested Install Process
````
mkdir \scripts
cd \scripts
git clone https://github.com/AR-k12code/hallpass.git
````

## Authorization File
HallPass should provide you a .ud file for authorizing your uploadings. Please copy this file into the c:\scripts\hallpass folder.

## Initial Settings File
````
cd \scripts\hallpass
Copy-Item settings_sample.ps1 settings.ps1
````
DO NOT ENTER YOUR CREDENTIALS UNTIL YOU HAVE RAN THE SCRIPT ONE TIME AND VERIFIED YOUR ZIP FILE WITH HallPass!!!

Make sure that $validBuildings contains the exact name for the campuses you want. These should match exactly what comes out of eSchool.

The rest of the settings are up to you. Set them to $True or $False

## Student Photos
Student photos are limited to 150kb in file size. Be good digital citizens, we don't need print quality photos for a thumbnail.

## Requirements
- CognosDownloader installed using the suggested install process
- Git
- Task Scheduler must run as the same user you used to save your eSchool/Cognos password.