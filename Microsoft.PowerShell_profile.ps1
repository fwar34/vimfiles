# 放到 C:\Users\username\Documents\WindowsPowerShell 下面以管理员执行，powershell 别名
function gtst {git status}
function gtl {git pull}
function gtp {git push}
function gtcmsg {git commit -m}
function gtco {git checkout}
function gtcl {git clone}
function gtd {git diff}

Invoke-Expression (& { (lua $HOME\z.lua\z.lua --init powershell) -join "`n" })

