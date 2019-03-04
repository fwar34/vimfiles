@echo off
reg query "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL | findstr 1080 && echo XXXX