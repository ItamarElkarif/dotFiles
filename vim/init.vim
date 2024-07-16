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

let g:mycolores = ['default', 'ron']

function! ChooseRandomColorScheme()
    let l:chosenColor = g:mycolors[localtime() % len(g:mycolors)]
    execute 'colorscheme ' . chosenColor
    " if has ('nvim') && (g:colors_name =='jhana' || g:colors_name == 'lucario')
        set termguicolors
    " else
    "     set notermguicolors
    " endif
endfunction

:command! RandomColorScheme call ChooseRandomColorScheme()



let g:mycolors = ['lucario', 'gruvbox', 'badwolf', 'brogrammer', 'molokai', 'janah', 'nord', 'habamax']
call ChooseRandomColorScheme()
