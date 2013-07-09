runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

colorscheme distinguished
set guifont=Source\ Code\ Pro\ Medium\ 10
set guicursor=i-r:block-Cursor/iCursor-blinkon600-blinkoff600
set guioptions-=Tt
set guitablabel=%f%M
set guitabtooltip=%F

set nobackup
set viminfo='20,\"50
set history=50
set ruler
set showmatch
set title
set showcmd
set modeline
set modelines=3

if has("syntax")
  syntax on

  " highlight trailing whitespace
  highlight BadWhitespace ctermbg=red guibg=red
  autocmd FileType * syntax match BadWhitespace /\s\+$/

  " highlight special keys
  highlight SpecialKey ctermfg=red guifg=red
endif

" mark tabs and non-breaking spaces
set list listchars=tab:»·,nbsp:━

" format options
" :help fo-table
set formatoptions=crotqc

" settings for Jedi
let g:jedi#autocompletion_command = "<C-n>"
let g:jedi#popup_on_dot = 0
let g:jedi#show_function_definition = "0"

" commenting
let b:comment_leader = '# '
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType tex let b:comment_leader = '% '

" comment
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
" uncomment
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR

" editing defaults
set ts=4 sts=4 tw=0 sw=4 expandtab smarttab cc=81

" file type defaults
au FileType tex,docbk,html set tw=78
au FileType tex,docbk,html,htmldjango ts=2 sts=2 sw=2

" tag bar
if has("gui_running")
    call tagbar#ToggleWindow()
    set columns=121
endif

" tabs
nnoremap <C-S-t> :tabnew<CR>
inoremap <C-S-t> <Esc>:tabnew<CR>

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt
