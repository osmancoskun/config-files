syntax on
set nocompatible
set t_Co=256
set cursorline
set termguicolors
call plug#begin()
  Plug 'scrooloose/nerdtree'
  Plug 'arcticicestudio/nord-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'ghifarit53/tokyonight-vim'
call plug#end()



let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set laststatus=2
let g:tokyonight_style = 'night'
colorscheme tokyonight 
set nu
set showmatch
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set paste
let python_highlight_all = 1

nnoremap <C-b> :NERDTreeToggle<CR>

function! ListFiles()
	let current_dir = expand('%:p:h')
	execute "silent! tabedit " . current_dir
	execute "silent! setlocal buftype=nofile"
	execute "silent! normal! gg"
	execute "silent! normal! i" . current_dir
endfunction

nnoremap <C-T> :call ListFiles()<CR>
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 2gt
nnoremap <A-4> 1gt
nnoremap <A-5> 1gt
nnoremap <A-6> 1gt
nnoremap <A-7> 1gt
nnoremap <A-8> 1gt
nnoremap <A-9> 1gt

map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader> tc :tabclose <cr>
map <leader> to :tabonly <cr>


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
