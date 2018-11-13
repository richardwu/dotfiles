" required by Vundle
set nocompatible
filetype off

" Begin Vundle plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'git://github.com/fatih/vim-go.git'

call vundle#end()
filetype plugin indent on
" }}}

syntax on
colorscheme torte
set nofoldenable

set number
set relativenumber
set expandtab
set wrap
set hlsearch
set smartindent
set shiftwidth=2
set softtabstop=2
au FileType cpp,c set shiftwidth=4 softtabstop=4
set cursorline
" For Windows: you will need to enable X11 Forwarding in PuTTY/other emulator AND run an X11 server (e.g. VcXsrv)
set clipboard=unnamed
set backspace=indent,eol,start
set maxmempattern=10000
" Code max length
" match ErrorMsg '\%>100v.\+'
" Comments max length
set cc=80

" Remap leader key
let mapleader=','

" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" bind K to grep word under cursor
nnoremap <C-K> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" tabs binding {{{
  " new
  map <C-t>n :tabnew<cr>
  " close
  map <C-t>c :tabc<cr>
  " first
  map <C-t>k :tabr<cr>
  " last
  map <C-t>j :tabl<cr>
  " previous
  map <C-t>h :tabp<cr>
  " next
  map <C-t>l :tabn<cr>
" }}}

" The Silver Searcher {{{
  if executable('ag')
    " Use ag over ack
    let g:ackprg='ag --nogroup --nocolor --column'
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
  endif
" }}}

" fzf {{{
  set rtp+=/usr/local/opt/fzf
  map <C-p> :Files<cr>
  let g:fzf_layout = {'down': '~30%'}

  let g:fzf_colors = {
        \ 'border': ['fg', 'Normal'] }
" }}}

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

  au FileType go nmap <leader>gd <Plug>(go-describe)
  au FileType go nmap <leader>gi <Plug>(go-info)
  au FileType go nmap <leader>gr <Plug>(go-referrers)
  au FileType go nmap <leader>gc <Plug>(go-callers)
  au FileType go nmap <leader>gm <Plug>(go-implements)
" }}}"

" Commenting blocks of code. {{{
autocmd FileType c,cpp,java,scala,go let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType ocaml              let b:comment_leader = '(* '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" }}}"

" crlogictest syntax highlighting
autocmd BufNewFile,BufRead */sql/logictest/testdata/* set filetype=crlogictest tw=0


" Tab labelling {{{
fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' '

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()
" }}}"
