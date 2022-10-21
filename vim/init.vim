" Use C-Tab for bp and bn
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>

set inccommand=split
set completeopt=menuone,noselect,noinsert

" Telescope
	nnoremap <c-p> <cmd>Telescope find_files<cr>
	nnoremap // <cmd>Telescope live_grep<cr>
	nnoremap <leader><Tab> <cmd>Telescope buffers<cr>

set mouse=a

" augroup HiglightTODO
"   autocmd!
"   autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
" augroup END

" Highlight yank
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}

if !has('unix')
	nnoremap <silent><leader>t :12sp<bar>:call termopen('powershell')<CR>a
endif

" Terminal Remapping
if has('nvim')
    " Make esc leave terminal mode
    tnoremap <leader><Esc> <C-\><C-n>
    tnoremap <Esc><Esc> <C-\><C-n>

    " Easy moving between the buffers
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l

    " Try and make sure to not mangle space items
    tnoremap <S-Space> <Space>
    tnoremap <C-Space> <Space>
endif

set laststatus=3
highlight WinSeparator guibg=None

" Assuming you have installed nvim-tree
lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
