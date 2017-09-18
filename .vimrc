execute pathogen#infect()

syntax on
filetype plugin indent on
" Folding (collapse sections)
" set fdm=syntax
set nofoldenable

color peachpuff
set number
set relativenumber
set expandtab
set wrap
set hlsearch
set smartindent
set shiftwidth=2
set softtabstop=2
set cursorline
set clipboard=unnamed
set backspace=indent,eol,start
match ErrorMsg '\%>100v.\+'

" The Silver Searcher
if executable('ag')
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" show up to 50 results
let g:ctrlp_match_window = 'results:50'

" set root of ag to current directory
let g:ag_working_path_mode="r"
endif

" bind K to grep word under cursor
nnoremap <C-K> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Vim Go {{{
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_command = "goimports"

  let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  let g:go_def_mode = 'godef'
" }}}"
