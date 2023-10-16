syntax on
set cursorline
set number 
set numberwidth=4
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 2gt
nnoremap <A-4> 1gt
nnoremap <A-5> 1gt
nnoremap <A-6> 1gt
nnoremap <A-7> 1gt
nnoremap <A-8> 1gt
nnoremap <A-9> 1gt

nnoremap <C-W> :q<CR>
highlight CursorLine cterm=bold 

function! ListFiles()
	let current_dir = expand('%:p:h')
	execute "silent! tabedit " . current_dir
	execute "silent! setlocal buftype=nofile"
	execute "silent! normal! gg"
	execute "silent! normal! i" . current_dir
endfunction

nnoremap <C-T> :call ListFiles()<CR>

function! AutoInsertPair(first, second)
	let before = getline('.')[col('.') - 2]
	let after = getline('.')[col('.') - 1]

	if before == a:first && after == a:second
		return "\<Right>"
	else
		return a:first . a:second . "\<Left>"
	endif
endfunction

inoremap ( <C-R>=AutoInsertPair('(',')')<CR>
inoremap [ <C-R>=AutoInsertPair('[',']')<CR>
inoremap " <C-R>=AutoInsertPair('"','"')<CR>

inoremap { <C-R>=AutoInsertPair('{','}')<CR>
inoremap < <C-R>=AutoInsertPair('<','>')<CR>

