@echo off

set TARGET_DATA_FOLDER=data-master
set SCRIPT_PATH=%~dp0

echo Start execute ddl script.

@REM Release 1
call ".\schema\01-RELEASE-202108\MYSQL_FILE_EXEC.bat"
call ".\%TARGET_DATA_FOLDER%\01-RELEASE-202108\MYSQL_FILE_EXEC.bat"

@REM Release 1.1
call ".\schema\02-RELEASE-202110\MYSQL_FILE_EXEC.bat"
call ".\%TARGET_DATA_FOLDER%\02-RELEASE-202110\MYSQL_FILE_EXEC.bat"

@REM Release 1.2 additional tables and data change
call ".\%TARGET_DATA_FOLDER%\03-RELEASE-202111\MYSQL_FILE_EXEC.bat"

@REM Release 2
call ".\schema\04-RELEASE-202202\MYSQL_FILE_EXEC.bat"
call ".\%TARGET_DATA_FOLDER%\04-RELEASE-202202\MYSQL_FILE_EXEC.bat"

echo Done execute ddl script.

pause