@ECHO off

:: Set default location
SET cpath=%cd%;.\classes;.\lib

:: Add classpath additions if present
IF EXIST classpath (
  FOR /f "tokens=*" %%a IN (classpath) DO CALL :concat %%a
)

:: Add all external JARs to our classpath if there is something in the lib folder
:: Got the first line from there: http://bit.ly/2eezcsG
>nul 2>nul dir /a-d /s "lib\*" && FOR /f "tokens=*" %%a IN ('dir /b /s .\lib\*.jar') DO CALL :concat %%a

:: Run it
java -classpath %cpath% %*
GOTO :eof

:concat
SET cpath=%cpath%;%1
GOTO :eof
