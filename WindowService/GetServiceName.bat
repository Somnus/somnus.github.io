@echo off
call:getServiceName
call :getServiceName 5 7
@echo %return% 
pause



:getServiceName
set /A return=%1%+%2%
goto:eof