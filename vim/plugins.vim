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
	Plug 'sheerun/vim-polyglot'

	Plug 'tpope/vim-fugitive'

	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround' " ys(motion)[ to add [, cs[{ to replace to { and ds{ to delete
	Plug 'tpope/vim-commentary' " gcc to comment a line
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-scripts/ReplaceWithRegister' " gr(motion) is to replace
	Plug 'justinmk/vim-sneak'
	Plug 'jremmen/vim-ripgrep'
	" Should learn undo tree
	" Plug 'sjl/gundo.vim'

	" TODO: Learn Debugging
	" Plug 'puremourning/vimspector'

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
