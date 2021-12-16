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
	Plug 'mhinz/vim-startify'

	" Should I replce with native lsp?
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc-snippets'

	Plug 'jremmen/vim-ripgrep'

	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-fugitive'

	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround' " ys(motion)[ to add [, cs[{ to replace to { and ds{ to delete
	Plug 'tpope/vim-commentary' " gcc to comment a line
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-scripts/ReplaceWithRegister' " gr(motion) is to replace
	Plug 'justinmk/vim-sneak'

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

call plug#end()

colorscheme gruvbox
let g:airline#extensions#tabline#enabled = 1

let g:gruvbox_contrast_dark = 'hard'

"======== Some lettings ========
let g:mapleader = "\<Space>"

" Remove C-H deleting stuff (Auto Pairs plugin)
let g:AutoPairsMapCh = 0

" ======== Keys Remmaping ========
if !has('nvim')
	let g:highlightedyank_highlight_duration = 200
endif

" Signify
	" Jump via hunks!
	nmap ) ]c
	nmap ( [c

	" Hunk textobj
	omap ic <plug>(signify-motion-inner-pending)
	xmap ic <plug>(signify-motion-inner-visual)
	omap ac <plug>(signify-motion-outer-pending)
	xmap ac <plug>(signify-motion-outer-visual)
	
	" Change sings
	let g:signify_sign_change = '~'
	let g:signify_sign_show_count = 0

" ======== Keys Remmaping ========
" Improving f\F with sneak
if has_key(plugs, "vim-sneak")
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
endif

nnoremap <c-c> "+y
vnoremap <c-v> "+p

" map <leader><Tab> <C-p><C-f>
nmap <leader>r gr
nmap <leader>c gc
vmap <leader>c gc

" Use <leader>g... to git commands
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gd :Gvdiff<CR>

" ======== Some Commands ========
execute 'command! EditSettings :e ' . g:dotFilesPath . 'gvimrc'
execute 'source ' . g:dotFilesPath . 'coc-config.vim'
