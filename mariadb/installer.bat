@echo off
::https://mariadb.com/kb/en/mysql_install_dbexe/

::ָ����������ĳ���
@set workdir=C:\opt\mariadb-10.4.6-winx64
@set installer=%workdir%/bin/mysql_install_db.exe

::���÷�����
@set datadir=c:\var\mariadb_data_node0
@set service="mariadb-v10.4.6"
::root�˺ŵ�����
@set password="111111"
@set port=3306
@set allow_remote_root_access=false



:MENU
cls
echo 1. ��װmariadb����
echo 2. ж��mariadb����
echo 3. �޸Ĳ���installer(��ǰΪ%installer%)
echo 4. �޸Ĳ���datadir  (��ǰΪ%datadir%)
echo 5. �޸Ĳ���service  (��ǰΪ%service%)
echo 6. �޸Ĳ���password (��ǰΪ%password%)
echo 7. �޸Ĳ���port     (��ǰΪ%port%)
echo 8. �޸Ĳ���allow_remote_root_access  (��ǰΪ%allow_remote_root_access%)

set /p choice2=��ѡ�����:
if %choice2%==1 goto INSTALL
if %choice2%==2 goto UNINSTALL
if %choice2%==3 goto MODIFY_PARAM_installer
if %choice2%==4 goto MODIFY_PARAM_datadir
if %choice2%==5 goto MODIFY_PARAM_service
if %choice2%==6 goto MODIFY_PARAM_password
if %choice2%==7 goto MODIFY_PARAM_port
if %choice2%==8 goto MODIFY_PARAM_allow_remote_root_access
echo ѡ�����������ѡ��
GOTO MENU

:MODIFY_PARAM_installer
set /p installer=������installer:
GOTO MENU
:MODIFY_PARAM_datadir
set /p datadir=������datadir:
GOTO MENU
:MODIFY_PARAM_service
set /p service=������service:
GOTO MENU
:MODIFY_PARAM_password
set /p password=������password:
GOTO MENU
:MODIFY_PARAM_port
set /p port=������port:
GOTO MENU
:MODIFY_PARAM_allow_remote_root_access
set /p allow_remote_root_access=������allow_remote_root_access:
GOTO MENU



::��װMariadb����
:INSTALL
cls
@echo on
%installer% --datadir %datadir% --service %service% --password %password% -port %port% --allow-remote-root-access %allow_remote_root_access%
GOTO FINISH

::ж��mariadb����ɾ�����ݿ��ļ�
:UNINSTALL
cls
@echo on
sc stop %service%
sc delete %service%
rmdir /s /q %datadir%
GOTO FINISH


:FINISH
pause