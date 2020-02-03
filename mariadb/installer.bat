@echo off
::https://mariadb.com/kb/en/mysql_install_dbexe/

::指定创建服务的程序
@set workdir=C:\opt\mariadb-10.4.6-winx64
@set installer=%workdir%/bin/mysql_install_db.exe

::设置服务名
@set datadir=c:\var\mariadb_data_node0
@set service="mariadb-v10.4.6"
::root账号的密码
@set password="111111"
@set port=3306
@set allow_remote_root_access=false



:MENU
cls
echo 1. 安装mariadb服务
echo 2. 卸载mariadb服务
echo 3. 修改参数installer(当前为%installer%)
echo 4. 修改参数datadir  (当前为%datadir%)
echo 5. 修改参数service  (当前为%service%)
echo 6. 修改参数password (当前为%password%)
echo 7. 修改参数port     (当前为%port%)
echo 8. 修改参数allow_remote_root_access  (当前为%allow_remote_root_access%)

set /p choice2=请选择操作:
if %choice2%==1 goto INSTALL
if %choice2%==2 goto UNINSTALL
if %choice2%==3 goto MODIFY_PARAM_installer
if %choice2%==4 goto MODIFY_PARAM_datadir
if %choice2%==5 goto MODIFY_PARAM_service
if %choice2%==6 goto MODIFY_PARAM_password
if %choice2%==7 goto MODIFY_PARAM_port
if %choice2%==8 goto MODIFY_PARAM_allow_remote_root_access
echo 选择错误，请重新选择
GOTO MENU

:MODIFY_PARAM_installer
set /p installer=请输入installer:
GOTO MENU
:MODIFY_PARAM_datadir
set /p datadir=请输入datadir:
GOTO MENU
:MODIFY_PARAM_service
set /p service=请输入service:
GOTO MENU
:MODIFY_PARAM_password
set /p password=请输入password:
GOTO MENU
:MODIFY_PARAM_port
set /p port=请输入port:
GOTO MENU
:MODIFY_PARAM_allow_remote_root_access
set /p allow_remote_root_access=请输入allow_remote_root_access:
GOTO MENU



::安装Mariadb服务
:INSTALL
cls
@echo on
%installer% --datadir %datadir% --service %service% --password %password% -port %port% --allow-remote-root-access %allow_remote_root_access%
GOTO FINISH

::卸载mariadb服务并删除数据库文件
:UNINSTALL
cls
@echo on
sc stop %service%
sc delete %service%
rmdir /s /q %datadir%
GOTO FINISH


:FINISH
pause