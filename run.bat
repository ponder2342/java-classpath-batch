@ECHO off

SET cpath=%cd%

FOR /f "tokens=*" %%a IN (classpath) DO CALL :concat %%a

java -classpath %cpath% %*
GOTO :eof

:concat
SET cpath=%cpath%;%1
GOTO :eof
