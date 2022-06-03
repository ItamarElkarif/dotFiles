if has('unix')
	let g:dotFilesPath = "/mnt/d/Documents/dotFiles/"
else
	let g:dotFilesPath = "D:/Documents/dotFiles/"
endif


" D:\Documents\DotFiles\vimrc_without-plugins
" /mnt/d/Documents/DotFiles/vimrc_without-plugins
execute 'source ' . g:dotFilesPath . 'vimrc_without-plugins'
set guifont=FiraCode:h14

call plug#begin('~/.vim/plugged')
	" Replace with galaxy
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'gruvbox-community/gruvbox'
	Plug 'luochen1990/rainbow'
	Plug 'mhinz/vim-startify'
	Plug 'tpope/vim-obsession'

	" Should I replce with native lsp?
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'tpope/vim-fugitive'

	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround' " ys(motion)[ to add [, cs[{ to replace to { and ds{ to delete
	Plug 'tpope/vim-commentary' " gcc to comment a line
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-scripts/ReplaceWithRegister' " gr(motion) is to replace
	Plug 'justinmk/vim-sneak'
	Plug 'jremmen/vim-ripgrep'
	Plug 'sjl/gundo.vim'

	" Custom textobj
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-entire'
	Plug 'kana/vim-textobj-indent'
	Plug 'thinca/vim-textobj-comment'

	if has('nvim')
		Plug 'nvim-lua/popup.nvim'
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-telescope/telescope-media-files.nvim'
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	else
		Plug 'machakann/vim-highlightedyank'
	endif

	if has("unix")
		Plug 'christoomey/vim-tmux-navigator'
	endif
call plug#end()

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

" ======== Keys Remmaping ========
if !has('nvim')
	let g:highlightedyank_highlight_duration = 200
endif

" ======== Keys Remmaping ========
" Improving f\F with sneak
if has_key(plugs, "vim-sneak")
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
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
execute 'command! EditSettings :e ' . g:dotFilesPath . 'gvimrc'
execute 'source ' . g:dotFilesPath . 'coc-config.vim'
