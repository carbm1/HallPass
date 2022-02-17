#DO NOT FILL THESE IN UNTIL YOU HAVE VERIFIED YOUR FILE WITH HALLPASS.
#YOU CAN RUN THE SCRIPT WITHOUT THEM AND SUBMIT YOUR ZIP FILE FOR REVIEW.
$username = ''
$password = ''

#what buildings?
$validBuildings = @('Gentry High School','Gentry Middle School')

#If you want homeroom teachers removed from the file.
$removeHomeroomTeachers = $false

#Do you want to include student photos?
$includeStudentPhotos = $true

#Path to the student photos folder. They can be in subfolders but need to be named [studentid].jpg Just like eSchool
#Images larger than 150kb will be ignored. We don't need print/photoshoot quality for eSchool or HallPass.
$studentPhotosFolder = "g:\Shared drives\LifeTouch\Combined\current\images"

#Do you want to include guardians?
$includeGuardians = $true

#Do you want to include Guardians Phone Numbers? Email Addresses will always be included.
$includeGuardianPhoneNumbers = $true