@echo off

rem install chocolatey
if not exist %ALLUSERSPROFILE%\chocolatey\choco.exe (
	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

rem install git
for /f %%I in ("git.exe") do (
	if not exist %%~$PATH:I (
		start choco install git -y
	)
)

if not exist %USERPROFILE%\vimfiles\vimrc (
	git clone https://github.com/fwar34/vimfiles.git %USERPROFILE%\vimfiles
	xcopy %USERPROFILE%\vimfiles\gitconfig %USERPROFILE%\.gitconfig \f
)

for /f %%I in ("fzf.exe") do (
	if not exist %%~$PATH:I (
		choco install fzf -y
	)
)

for /f %%I in ("wget.exe") do (
	if not exist %%~$PATH:I (
		choco install wget -y
	)
)

for /f %%I in ("curl.exe") do (
	if not exist %%~$PATH:I (
		choco install curl -y
	)
)

for /f %%I in ("ag.exe") do (
	if not exist %%~$PATH:I (
		choco install ag -y
	)
)

for /f %%I in ("ctags.exe") do (
	if not exist %%~$PATH:I (
		choco install ctags -y
	)
)


for /f %%I in ("python.exe") do (
	if not exist %%~$PATH:I (
		choco install python3 -y
	)
)

for /f %%I in ("7z.exe") do (
	if not exist %%~$PATH:I (
		choco install 7zip -y
	)
)

if not exist "C:\Program Files\Vim\vim81\gvim.exe" (
	wget https://github.com/vim/vim-win32-installer/releases/download/v8.1.0868/gvim_8.1.0868_x64.exe -O %TEMP%\gvim.exe
	%TEMP%\gvim.exe
)

for /f %%I in ("gtags.exe") do (
	if not exist %%~$PATH:I (
		wget http://adoxa.altervista.org/global/dl.php?f=win32 -O %TEMP%\global.zip
		7z x %TEMP%\global.zip -o%USERPROFILE%\global
		SET "PATH=%PATH%;%USERPROFILE%%\global\bin"
	)
)

