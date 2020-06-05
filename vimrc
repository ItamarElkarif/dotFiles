set nocompatible

filetype plugin indent on
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set nowrap
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set expandtab
set virtualedit=onemore
set relativenumber
set number
set hlsearch incsearch
"" set spell Takes a lot of memory
set splitright 
set splitbelow
set ignorecase & smartcase
set tw=0
set autoread
set confirm
set wildmenu                          " Tab autocomplete in command mode
set nobackup nowritebackup " Turn off backup files
set path +=**           "" Allowing you to search files recursivly in root folder.
noh

"Only If ZSH: 
""set shell=/bin/zsh
set encoding=utf-8

hi Search guibg=LightBlue

call plug#begin('~/.vim/plugged')
" Some Beutify
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
" Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " Doesn't work with the font

Plug 'kien/ctrlp.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-commentary' " gcc to comment a line

" Some auto complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --system-libclang'}

Plug 'tpope/vim-repeat'
Plug 'vim-scripts/repeatable-motions.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' " ys(motion)[ to add [, cs[{ to replace to { and ds{ to delete
Plug 'vim-scripts/ReplaceWithRegister' " gr(motion) is to replace
Plug 'easymotion/vim-easymotion' " <Leader><Leader>f/k/j to easymotion

" Plug 'nathanaelkane/vim-indent-guides'
" Custom textobj
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'thinca/vim-textobj-comment'

if has('nvim')
    Plug 'sbdchd/neoformat'
else
    Plug 'Chiel92/vim-autoformat'
endif
" Plug 'prettier/vim-prettier'
Plug 'tpope/vim-speeddating'

" Live interactive interpeter
Plug 'metakirby5/codi.vim'

Plug 'tpope/vim-unimpaired'


" Languages: Python
Plug 'klen/python-mode'
Plug 'nvie/vim-flake8'
Plug 'hdima/python-syntax'
call plug#end()


" Color Scheme
set bg=dark
colorscheme badwolf

" AirLine stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

" Activate rainbow parentheses
let g:rainbow_active = 1

"====[ Make the 121st column stand out ]====
highlight ColorColumn ctermbg=darkblue
call matchadd('ColorColumn', '\%121v', 100)

"====Showing trail spaces====
set listchars=nbsp:^,trail:.
set list

"===Starting and coloring the indent===
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"======== Some lettings ========
let g:mapleader = "\<Space>"

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|pyc)$'
            \ }
let g:NERDTreeIgnoremap = ['\.swp$', '^\.pyc$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeGitStatusWithFlags = 1
" let  g:NERDTreeDirArrowExpandable = '>'
" let  g:NERDTreeDirArrowCollapsible = '<'

let g:highlightedyank_highlight_duration = 300

" Remove C-H deleting stuff (Auto Pairs plugin)
iunmap <buffer> <C-H>

" Disable python rope and refarcotring, Turn the first one to 1 to create .ropeprojects everywhere.
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0

" Set the git timer before checking for line updates
set updatetime=100

let $BASH_ENV = "$HOME/.zshrc"

"======== Keys Remmaping ========
" Makes the easymotion compatible with hjkl and made \ to easymotion leader leader
map <Leader> <Plug>(easymotion-prefix)
map \l <Plug>(easymotion-lineforward)
map \j <Plug>(easymotion-j)
map \k <Plug>(easymotion-k)
map \h <Plug>(easymotion-linebackward)
map s <Plug>(easymotion-s)

map <silent><C-b> :NERDTreeToggle<CR>

" Opens The buffer list of ctrlp
map <leader><Tab> <C-p><C-f>

" python stuff bnd to leader p.
let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_run_bind = '<leader>pr'

" To exit buffers without closing vim.
map <silent><leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" map <leader>b <C-^>
map <leader>b :bp<CR>

map <silent><leader>n :noh<CR>
map <leader>r gr
map <leader>c gc
" noremap <a-cr> I<CR><Esc> NOT Working atm.
noremap <CR> A<CR><Esc>
map <silent><leader>w :update<CR>

" Make the search also center the view
noremap n nzz
noremap N Nzz

" In command mode, make ctrl h/j/k/l to act as arrows.
cmap <C-K> <Up>
cmap <C-J> <Down>
cmap <C-H> <Left>
cmap <C-L> <Right>
cmap <C-E> <Esc>

" in insert mode, make ctrl h/j/k/l to act as arrows.
imap <C-K> <Up>
imap <C-J> <Down>
imap <C-H> <Left>
imap <C-L> <Right>

" Made jj into Esc (Might replace with <CapsLock>)
inoremap jj <Esc>
cmap jj <End><C-u><BS>

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Skip the <C-w> stuff for hjkl with alt. NOTE: Doesn't work with neovim
nnoremap  <C-H> <C-W><C-H>
nnoremap  <C-J> <C-W><C-J>
nnoremap  <C-K> <C-W><C-K>
nnoremap  <C-L> <C-W><C-L>

" Auto Formater (KeyBind and On Save)
if exists(':Autoformat')
    let g:formatter_yapf_style = 'pep8'
    nnoremap <F3> :Autoformat<CR>
    " au BufWrite * :Autoformat
endif
if exists(':Neoformat')
    nnoremap <F3> :Neoformat<CR>
    let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
    let g:neoformat_enabled_json = ['prettier', 'js-beautify']
    " au BufWrite * :Neoformat
endif

" Use <leader>g... to git commands
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gd :Gvdiff<CR>


nmap <C-S> :set spell<CR>

"======== Some Commands ========

" When reading a buffer, unfold all
au BufRead * normal zR

" Set autoread on cursor resting 4 sec or so (Or buff switch)
"au FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

command! SumYanked :echo "Sum: " eval(join(split(@", '[^-0-9\.]\+\|\.\.\+'), '+')) <bar> let @" = string(eval(join(split(@", '[^-0-9\.]\+\|\.\.\+'), '+')))
command! WriteSudo :update !sudo tee %
command! CDC :lcd %:p:h
command! Count :%s///gn
command! RemoveTrailingWhitespaces :%s/\s\+$//e

" Open most recently used files on start
 autocmd VimEnter * Mru .
" For some reason it needs to be at the end of the file
set showcmd

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner

let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
