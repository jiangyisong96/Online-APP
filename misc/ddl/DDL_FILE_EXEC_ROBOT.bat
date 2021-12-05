@echo off

set TARGET_DATA_FOLDER=data-robot
set SCRIPT_PATH=%~dp0

echo Start execute robot ddl script.

@REM Release 1
call ".\%TARGET_DATA_FOLDER%\03-RELEASE-202111\MYSQL_FILE_EXEC.bat"

echo Done execute robot ddl script.

pause