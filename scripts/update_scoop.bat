@ECHO OFF

@REM _____SCOOP APPLICATIONS_____
ECHO Update scoop repositories
CALL scoop update
ECHO Locate all outdated scoop applications
CALL scoop status

SET choice=
SET /p choice=Would you like to upgrade the listed scoop applications (y/n)? [n]: 
IF '%choice%'=='y' (
    ECHO Updating all scoop applications
    CALL scoop update --all
)

PAUSE