::a command tool for installing mariadb
::put this file under the root directory of the decompressed zip(which contains bin directory)
::you can also use the cmd manually with this doc: https://mariadb.com/kb/en/mysql_install_dbexe/
::shared with CC-BY-NC-SA, repository url: https://github.com/spawpaw/code-snipppet

::run as admin
@echo off & setlocal enabledelayedexpansion
%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof
:Admin

::the base dir
@set workdir=%~dp0
@set installer=%workdir%/bin/mysql_install_db.exe

::where to save db data
@set datadir=%workdir%\db_data
::the windows service's name
@set service=mariadb
::password for root user
@set password=111111
::port
@set port=3306
@set allow_remote_root_access=false



:MENU
cls
echo 1. install mariadb as a windows service
echo 2. uninstall mariadb
echo 3. change option [installer] (current: %installer%)
echo 4. change option [datadir]   (current: %datadir%)
echo 5. change option [service]   (current: %service%)
echo 6. change option [password]  (current: %password%)
echo 7. change option [port]      (current: %port%)
echo 8. change option [allow_remote_root_access]  (current: %allow_remote_root_access%)

set /p choice2=input the option index:
if %choice2%==1 goto INSTALL
if %choice2%==2 goto UNINSTALL
if %choice2%==3 goto MODIFY_PARAM_installer
if %choice2%==4 goto MODIFY_PARAM_datadir
if %choice2%==5 goto MODIFY_PARAM_service
if %choice2%==6 goto MODIFY_PARAM_password
if %choice2%==7 goto MODIFY_PARAM_port
if %choice2%==8 goto MODIFY_PARAM_allow_remote_root_access
echo wrong option, please reselect
GOTO MENU

:MODIFY_PARAM_installer
set /p installer=please input installer:
GOTO MENU
:MODIFY_PARAM_datadir
set /p datadir=please input datadir:
GOTO MENU
:MODIFY_PARAM_service
set /p service=please input service:
GOTO MENU
:MODIFY_PARAM_password
set /p password=please input password:
GOTO MENU
:MODIFY_PARAM_port
set /p port=please input port:
GOTO MENU
:MODIFY_PARAM_allow_remote_root_access
set /p allow_remote_root_access=please input allow_remote_root_access (true/false):
GOTO MENU



::install mariadb as a windows service
:INSTALL
cls
@echo on
%installer% --datadir=%datadir% --service=%service% --password=%password% --port=%port% --allow-remote-root-access=%allow_remote_root_access%
::start the service
sc start %service%
@echo off
GOTO FINISH

::uninstall mariadb service and delete the data directory
:UNINSTALL
cls
@echo on
::stop service
sc stop %service%
::delete service
sc delete %service%
::delete data directory
rmdir /s /q %datadir%
@echo off
GOTO FINISH


:FINISH
pause