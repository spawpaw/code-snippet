::shared with CC-BY-NC-SA, repository url: https://github.com/spawpaw/code-snipppet
::run as admin
:@echo off & setlocal enabledelayedexpansion
%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof
:Admin