@ECHO off

:: Set default Locations
SET cpath=%cd%;.\lib;.\classes
SET spath=%cd%;.\src

IF EXIST classdest (
  SET /p cdest=<classdestination
) else (
  SET cdest=classes
)

:: Add all external JARs to our classpath if there is something in the lib folder
:: Got the first line from there: http://bit.ly/2eezcsG
>nul 2>nul dir /a-d /s "folderName\*" && FOR /f "tokens=*" %%a IN ('dir /b /s .\lib\*.jar') DO CALL :concat_cpath %%a

:: Read in additional class- and sourcepaths from file
IF EXIST classpath (
  FOR /f "tokens=*" %%a IN (classpath) DO CALL :concat_classpath %%a
)

:: Read in sourcepath additions if there are any.
IF EXIST sourcepath (
  FOR /f "tokens=*" %%a IN (sourcepath) DO CALL :concat_spath %%a
)

:: Now call the compiler with the Configuration we just gathered.
javac -classpath %cpath% -sourcepath %spath% -d %cdest% %*
GOTO :eof

:concat_cpath
SET cpath=%cpath%;%1
GOTO :eof

:concat_spath
SET spath=%spath%;%1
GOTO :eof

