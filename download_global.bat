@echo off
for /f %%I in ("gtags.exe") do (
	if not exist %%~$PATH:I (
        wget http://adoxa.altervista.org/global/dl.php?f=win32 -O %TEMP%\global.zip
		7z x %TEMP%\global.zip -o%USERPROFILE%\global
		SET "PATH=%PATH%;%USERPROFILE%\global\bin"
	)
) 

@echo on
