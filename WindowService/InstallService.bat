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
nssm set %serviceName% Description "С��������POSϵͳ����2.0�汾������������������𵥣������ϴ����صȹ��ܡ�"
nssm set %serviceName% DependOnService "MYSQL56"


nssm start %serviceName%

echo wscript.sleep 500>sleep.vbs
@start /wait sleep.vbs
@del /f /s /q sleep.vbs>nul

::nssm stop %serviceName%


















::@echo �����ܼ��
::cd C:\Windows\System32
::c:
::curl -s http://localhost:8088/api/basic/test >check.txt
::set /p str=<check.txt
::echo %str%|findstr "200" >nul 
::if %errorlevel% equ 0 (  
::echo ���񴴽��ɹ�
::) else (  
::echo ���񴴽�ʧ��  
::) 


