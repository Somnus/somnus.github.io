@echo off
set /p type=please input publish type£º
chcp 65001
setlocal enabledelayedexpansion
set file=%~dp0%\config.json
set file_tmp=%~dp0%\config_tmp.json
set file_bak=%~dp0%\config_bak.json

set source=http://smdc.xlyuntech.com
set replaced=http://dc.xlyuntech.com:5765

if "%type%"=="0"(
    set temp=%source%
    set source=%replaced%
    set replaced=%temp%
)

for /f "delims=" %%i in (%file%) do (
    set str=%%i
        set "str=!str:%source%=%replaced%!"
        echo !str!>>%file_tmp%
)
copy "%file%" "%file_bak%" >nul 2>nul
move "%file_tmp%" "%file%"
del /f "%file_bak%"