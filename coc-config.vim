"==================Old - completion==================
    " inoremap <silent><expr> <TAB>
    " 	  \ pumvisible() ? coc#_select_confirm() :
    " 	  \ coc#expandableOrJumpable() ?
    " 	  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    " 	  \ <SID>check_back_space() ? "\<TAB>" :
    " 	  \ coc#refresh()
    " function! s:check_back_space() abort
    " 	  let col = col('.') - 1
    " 	  return !col || getline('.')[col - 1]  =~# '\s'
    " 	endfunction


"==================Current - completion==================
    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    let g:coc_snippet_next = '<tab>'

    nmap <silent>gd <Plug>(coc-definition)
    nmap <silent><F3> <Plug>(coc-format)
    nmap <silent><F6> <Plug>(coc-rename)
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nnoremap <silent><leader>gr <Plug>(coc-references)
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " Apply AutoFix to problem on the current line.
    nmap <leader> fc <Plug>(coc-fix-current)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    nmap <silent>gh :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
	call CocActionAsync('doHover')
      else
	execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')


    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
