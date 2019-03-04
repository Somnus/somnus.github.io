@echo off

set basepath=%~d0
set path=%~dp0
set nssmPath=%path%nssm-2.24\win64
@echo %nssmPath%
set serviceName="WebApi2"


cd %nssmpath%
%basepath%


nssm stop %serviceName% confirm

echo wscript.sleep 500>sleep.vbs
@start /wait sleep.vbs
@del /f /s /q sleep.vbs>nul

nssm remove %serviceName% confirm

echo wscript.sleep 500>sleep.vbs
@start /wait sleep.vbs
@del /f /s /q sleep.vbs>nul


nssm install %serviceName% "%path%WebApi\Framework.Website.API.exe"
nssm set %serviceName% Description "小龙云智能POS系统服务2.0版本，包括收银，后厨，拆单，数据上传下载等功能。"
nssm set %serviceName% DependOnService "MYSQL56"


nssm start %serviceName%

echo wscript.sleep 500>sleep.vbs
@start /wait sleep.vbs
@del /f /s /q sleep.vbs>nul

::nssm stop %serviceName%


















::@echo 服务功能检测
::cd C:\Windows\System32
::c:
::curl -s http://localhost:8088/api/basic/test >check.txt
::set /p str=<check.txt
::echo %str%|findstr "200" >nul 
::if %errorlevel% equ 0 (  
::echo 服务创建成功
::) else (  
::echo 服务创建失败  
::) 


