@ECHO off

:: Set default location
SET cpath=%cd%;.\classes;.\lib

:: Add classpath additions if present
IF EXIST classpath (
  FOR /f "tokens=*" %%a IN (classpath) DO CALL :concat %%a
)

:: Run it
java -classpath %cpath% %*
GOTO :eof

:concat
SET cpath=%cpath%;%1
GOTO :eof
