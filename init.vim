" Use C-Tab for bp and bn
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>

set inccommand=split
set completeopt=menuone,noselect

" Telescope
	nnoremap <c-p> <cmd>Telescope find_files<cr>
	nnoremap // <cmd>Telescope live_grep<cr>
	nnoremap <leader><Tab> <cmd>Telescope buffers<cr>

set mouse=a

augroup HiglightTODO
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

" Highlight yank
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
