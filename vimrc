"=========================================
"  Author: liang.feng
"  Version: 1
"  Date: 2019/03/03
"  Sections:
"=========================================

if has('win32')
    source ~\AppData\Local\nvim\autoload\plug.vim
    source ~\AppData\Local\nvim\autoload\gtags.vim
    source ~\AppData\Local\nvim\autoload\gtags-cscope.vim
    source ~\AppData\Local\nvim\init.vim
else
    source ~/mine/nvim/autoload/plug.vim
    source ~/mine/nvim/autoload/gtags.vim
    source ~/mine/nvim/autoload/gtags-cscope.vim
    source ~/mine/nvim/init.vim
endif
