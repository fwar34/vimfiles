# 以管理员权限在新的powershell中运行本脚本
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}

#要安装的包的字符串数组
$packages_choco="fzf","svn","wget","curl","ag","diffutils","universal-ctags","7zip","python3"
$packages_scoop="fd","ripgrep","figlet","findutils","less","bat","unxutils"

function require_pkg_choco($pkg)
{
    $find_pkg=$pkg
    switch ($pkg)
    {
        "diffutils"
        {
            $find_pkg="diff3"
        }
        "universal-ctags"
        {
            $find_pkg="ctags"
        }
        "7zip"
        {
            $find_pkg="7z"
        }
    }

    Get-Command -Name $find_pkg 2>error.txt
    if ($?) {
        echo "find $pkg"
    } else {
        echo "choco install $pkg ......................................................................"
        choco install $pkg -y
    }
}

function require_pkg_scoop($pkg)
{
    $find_pkg=$pkg
    switch ($pkg)
    {
        "ripgrep"
        {
            $find_pkg="rg"
        }
        "findutils"
        {
            $find_pkg="xargs"
        }
        "unxutils"
        {
            $find_pkg="bc"
        }
    }
    
    Get-Command -Name $find_pkg 2>error.txt
    if ($?) {
        echo "find $pkg"
    } else {
        echo "scoop install $pkg ......................................................................"
        scoop install $pkg
    }
}

foreach ($pkg in $packages_choco) {
    require_pkg_choco($pkg)
}

foreach ($pkg in $packages_scoop) {
    require_pkg_scoop($pkg)
}

echo "All complete"

"Any key to exit." ;
[Console]::Readkey() |　Out-Null ;
Exit ;
