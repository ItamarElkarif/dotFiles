if has('unix')
	let g:dotFilesPath = "/mnt/d/Documents/dotFiles/"
else
	let g:dotFilesPath = "D:/Documents/dotFiles/"
endif


" D:\Documents\DotFiles\vim\without_plugins.vim
" /mnt/d/Documents/DotFiles/vim/without_plugins.vim
execute 'source ' . g:dotFilesPath . 'vim/without_plugins.vim'
set guifont=FiraCode:h14

" D:\Documents\DotFiles\vim\plugins.vim
" /mnt/d/Documents/DotFiles/vim/plugins.vim
execute 'source ' . g:dotFilesPath . 'vim/plugins.vim'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Activate rainbow parentheses
let g:rainbow_active = 1

"======== Some lettings ========
let g:mapleader = "\<Space>"

" Remove C-H deleting stuff (Auto Pairs plugin)
let g:AutoPairsMapCh = 0

" Auto saves sessions with startify
let g:startify_session_persistence = 1
" ======== Keys Remmaping ========
if !has('nvim')
	let g:highlightedyank_highlight_duration = 200
endif

" Improving f\F with sneak
if has_key(plugs, "vim-sneak")
    nmap F <Plug>Sneak_F
    nmap T <Plug>Sneak_T
    nmap f <Plug>Sneak_f
    nmap t <Plug>Sneak_t

    omap F <Plug>Sneak_F
    omap T <Plug>Sneak_T
    omap f <Plug>Sneak_f
    omap t <Plug>Sneak_t

    xmap F <Plug>Sneak_F
    xmap T <Plug>Sneak_T
    xmap f <Plug>Sneak_f
    xmap t <Plug>Sneak_t
    let g:sneak#label = 1
endif

nnoremap <c-c> "+y
vnoremap <c-v> "+p

" map <leader><Tab> <C-p><C-f>
nmap <leader>r gr
nmap <leader>c gc
vmap <leader>c gc

" Use <leader>g... to git commands
nmap <leader>gc :Gitcommit<CR>
nmap <leader>gs :Git<CR>
nmap <leader>gd :Gvdiffsplit<CR>

nnoremap <F5> :GundoToggle<CR>

" EZ Tmux navigation
if has('unix')
	let g:tmux_navigator_no_mappings = 1

	nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
	nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
	nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
	nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
endif

" ======== Some Commands ========
execute 'command! EditSettings :e ' . g:dotFilesPath . 'vim/general.vim'
execute 'source ' . g:dotFilesPath . 'vim/coc-config.vim'
