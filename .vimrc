set number
set expandtab
set wrap
set hlsearch
set smartindent
set shiftwidth=2
set softtabstop=2
set cursorline
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ag
set clipboard=unnamedplus
match ErrorMsg '\%>120v.\+'

" The Silver Searcher
if executable('ag')
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" show up to 100 results
let g:ctrlp_match_window = 'results:100'

" set root of ag to current directory
let g:ag_working_path_mode="r"
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

