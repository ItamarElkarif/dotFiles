source $VIMRUNTIME/vimrc_example.vim
behave xterm

source D:\\Documents\\DotFiles\\vimrc_without-plugins
set guifont=Courier_New:h14

call plug#begin('D:/Program\ Files/Vim/vimfiles/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

let g:airline#extensions#tabline#enabled = 1

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
" Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons' " Doesn't work with the font

Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-commentary' " gcc to comment a line

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'

Plug 'jremmen/vim-ripgrep'
Plug 'Yggdroot/LeaderF'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' " ys(motion)[ to add [, cs[{ to replace to { and ds{ to delete
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/ReplaceWithRegister' " gr(motion) is to replace
Plug 'easymotion/vim-easymotion' " <Leader><Leader>f/k/j to easymotion

" Custom textobj
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'thinca/vim-textobj-comment'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

"======== Some lettings ========
let g:mapleader = "\<Space>"
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:NERDTreeIgnoremap = ['\.swp$', '^\.DS_Store$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1
" let  g:NERDTreeDirArrowExpandable = '>'
" let  g:NERDTreeDirArrowCollapsible = '<'

" Remove C-H deleting stuff (Auto Pairs plugin)
let g:AutoPairsMapCh = 0
let g:highlightedyank_highlight_duration = 200

" GitGutter
" let g:gitgutter_enabled = 1
autocmd BufReadPost,CursorHold,CursorHoldI,WinEnter * :GitGutterAll

" ======== Keys Remmaping ========

" Makes the easymotion compatible with hjkl
map \l <Plug>(easymotion-lineforward)
map \j <Plug>(easymotion-j)
map \k <Plug>(easymotion-k)
map \h <Plug>(easymotion-linebackward)

map <silent><C-b> :NERDTreeToggle<CR>
" map <leader><Tab> <C-p><C-f>
nmap <leader>r gr
nmap <leader>c gc
nmap s <Plug>(easymotion-f)
nmap S <Plug>(easymotion-F)

nnoremap <c-c> "+y
vnoremap <c-v> "+p

" Use <leader>g... to git commands
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gd :Gvdiff<CR>

" Use C-Tab for bp and bn
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>

" ======== Some Commands ========
command! EditSettings :e D:\Documents\DotFiles\gvimrc

" ======== Some Coc ========
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

let g:coc_snippet_next = '<tab>'

nmap <silent>gd <Plug>(coc-definition)
nmap <silent><F3> <Plug>(coc-format)
nmap <silent><F6> <Plug>(coc-rename)
nmap <silent><F2> <Plug>(coc-diagnostic-next)
nmap <silent><S-F2> <Plug>(coc-diagnostic-prev)
nmap <silent>gh <Plug>(coc-diagnostic-info)
nnoremap <silent><leader>gr <Plug>(coc-references)
nmap <silent><C-space> <Plug>(coc-fix-current)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
