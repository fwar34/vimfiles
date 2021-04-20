@echo off

@rem ----------------------------------------------------------
@rem windows subsystem linux:
@rem https://github.com/goreliu/wsl-terminal
@rem ----------------------------------------------------------

rem install chocolatey
if not exist %ALLUSERSPROFILE%\chocolatey\choco.exe (
	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

rem install git
REM for /f %%I in ("git.exe") do (
	REM if not exist %%~$PATH:I (
		REM start choco install git -y
	REM )
REM )

if not exist %USERPROFILE%\vimfiles\vimrc (
	git clone https://github.com/fwar34/vimfiles.git %USERPROFILE%\vimfiles
	xcopy %USERPROFILE%\vimfiles\gitconfig.windows %USERPROFILE%\.gitconfig \f
	xcopy %USERPROFILE%\vimfiles\globalrc %USERPROFILE%\.globalrc \f
)

if not exist %USERPROFILE%\AppData\Local\nvim\init.vim (
	git clone https://github.com/fwar34/nvim.git %USERPROFILE%\AppData\Local\nvim
)

for /f %%I in ("fzf.exe") do (
	if not exist %%~$PATH:I (
		choco install fzf -y
	)
)

for /f %%I in ("svn.exe") do (
	if not exist %%~$PATH:I (
		choco install svn -y
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

for /f %%I in ("diff.exe") do (
	if not exist %%~$PATH:I (
		choco install diffutils -y
	)
)

REM for /f %%I in ("ctags.exe") do (
	REM if not exist %%~$PATH:I (
		REM choco install ctags -y
	REM )
REM )

for /f %%I in ("ctags.exe") do (
	if not exist %%~$PATH:I (
		choco install universal-ctags -y
	)
)


REM for /f %%I in ("python.exe") do (
	REM if not exist %%~$PATH:I (
		REM choco install python3 -y
	REM )
REM )

for /f %%I in ("7z.exe") do (
	if not exist %%~$PATH:I (
		choco install 7zip -y
	)
)

for /f %%I in ("fd.exe") do (
    if not exist %%~$PATH:I (
        scoop install fd 
    )
)

for /f %%I in ("figlet.exe") do (
    if not exist %%~$PATH:I (
        scoop install figlet
    )
)

for /f %%I in ("rg.exe") do (
    if not exist %%~$PATH:I (
        scoop install ripgrep
    )
)

rem find is proxy exist, if it is exist and set environment variable has_proxy
reg query "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable | findstr 0x1 && set has_proxy=1
set wget_config="%USERPROFILE%\.wgetrc"
if defined has_proxy (
    if exist %wget_config% (
        echo delete exist wget config file
        del %wget_config%
    )
    echo http-proxy = 127.0.0.1:1080 > %wget_config%
    echo set proxy for wget
)

reg query "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL | findstr pac && set has_pac_proxy=1
if defined has_pac_proxy (
    if exist %wget_config% (
        echo delete exist wget config file
        del %wget_config%
    )
    echo http-proxy = 127.0.0.1:1080 > %wget_config%
    echo set proxy for wget
)

if not exist "C:\Program Files\Vim\vim81\gvim.exe" if not exist "C:\Program Files (x86)\Vim\vim81\gvim.exe" (
		rem Note:
		rem python3 32bit + gvim 32bit
		rem python3 64bit + gvim 64bit
		rem wget https://github.com/vim/vim-win32-installer/releases/download/v8.1.0868/gvim_8.1.0868_x64.exe -O %TEMP%\gvim.exe

		echo ------------------------------------------------------------------------------
		echo start download 32 bit gvim
		echo ------------------------------------------------------------------------------
		pause
		wget https://github.com/vim/vim-win32-installer/releases/download/v8.1.0868/gvim_8.1.0868_x86.exe -O %TEMP%\gvim.exe
		%TEMP%\gvim.exe
)

for /f %%I in ("gtags.exe") do (
    if not exist %%~$PATH:I (
        wget http://adoxa.altervista.org/global/dl.php?f=win32 -O %TEMP%\global.zip
        7z x %TEMP%\global.zip -o%USERPROFILE%\global
        SET "PATH=%PATH%;%USERPROFILE%\global\bin"
    )
)

REM start download_global.bat

if exist %wget_config% (
    echo delete wget config file
    del %wget_config%
)

rem delete environment variable
set has_proxy=

@echo on
