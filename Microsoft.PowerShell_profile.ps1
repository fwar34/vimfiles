# 放到 C:\Users\username\Documents\WindowsPowerShell 下面以管理员执行，powershell 别名
function gtst {git status $args}
function gtl {git pull $args}
function gtp {git push $args}
function gtcmsg {git commit -m $args}
function gtco {git checkout $args}
function gtcl {git clone $args}
function gtd {git diff $args}
function gta {git add $args}

#New-Alias -Name gta -Value "git add"
#New-Alias -Name gtmsg -Value gtcmsg
#Set-Alias -Name gst -Value gtst
#Set-Alias -Name gl -Value gtl -Force
#Set-Alias -Name gp -Value gtp -Force
#
#Set-Alias -Name gcmsg -Value gtcmsg
#Set-Alias -Name gco -Value gtco
#Set-Alias -Name gcl -Value gtcl
#Set-Alias -Name ga -Value gta

Invoke-Expression (& { (lua $HOME\z.lua\z.lua --init powershell) -join "`n" })

