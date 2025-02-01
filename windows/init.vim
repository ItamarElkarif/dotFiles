set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
source ~\Documents\dotFiles\vim\general.vim

command! EditSettings e ~\AppData\Local\nvim/init.vim

source ~\Documents\dotFiles\vim\init.vim

set guifont=FiraCode:h16
