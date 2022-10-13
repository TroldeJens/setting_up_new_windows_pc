@ECHO OFF

@REM _____WINGET APPLICATIONS_____
ECHO Locate all outdated winget applications
CALL winget upgrade

SET choice=
SET /p choice=Would you like to upgrade the listed winget applications (y/n)? [n]: 
IF '%choice%'=='y' (
    ECHO Updating all winget applications
    CALL winget upgrade --all
)

PAUSE