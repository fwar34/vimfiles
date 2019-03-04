@echo off
REM reg query  "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable|findstr 0x0&® add  "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t reg_dword /d 1 /f||reg add  "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t reg_dword /d 0 /f

REM reg query "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable | findstr 0x1&echo HHHHHHHHH
reg query "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable | findstr 0x0 && echo close
reg query "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable | findstr 0x1 && echo open
@echo on
