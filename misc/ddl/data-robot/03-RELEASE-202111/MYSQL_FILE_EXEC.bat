@echo off

SET SCRIPT_PATH=%~dp0

echo Start execute sql script under %SCRIPT_PATH%.
FOR /R %SCRIPT_PATH% %%f in (*.sql) do (
   echo Executing %%f...
   mysql --defaults-extra-file=%SCRIPT_PATH%MYSQL.conf < "%%f"
)
echo Done execute sql script under %SCRIPT_PATH%.