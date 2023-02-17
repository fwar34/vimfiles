# 放到 C:\Users\username\Documents\WindowsPowerShell 下面以管理员执行，powershell 别名
function gst {git status}
function gl {git pull}
function gp {git push}
function gcmsg {git commit -m}

Invoke-Expression (& { (lua $HOME\z.lua\z.lua --init powershell) -join "`n" })

