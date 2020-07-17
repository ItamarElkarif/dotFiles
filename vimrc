source .\vimrc_without-plugins

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
" Plug 'wincent/Command-T'

Plug 'scrooloose/nerdtree'
" Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " Doesn't work with the font

Plug 'kien/ctrlp.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-commentary' " gcc to comment a line
Plug 'ervandew/supertab'

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
colorscheme badwolf

" AirLine stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

" Activate rainbow parentheses
let g:rainbow_active = 1

"===Starting and coloring the indent===
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"======== Some lettings ========
" Remove C-H deleting stuff (Auto Pairs plugin)
let g:AutoPairsMapCh = 0

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

" Disable python rope and refarcotring, Turn the first one to 1 to create .ropeprojects everywhere.
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0

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

nnoremap <leader>r gr
nnoremap <leader>c gc

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

"======== Some Commands ========
