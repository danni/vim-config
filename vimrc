" settings for python-mode
let g:pymode_run = 0
let g:pymode_lint_checker = "pep8,pylint"
let g:pymode_rope_autocomplete_map = '<C-n>'
let g:pymode_folding = 0
let g:pymode_lint_ignore = "F0401"
let g:pymode_lint_signs = 0
let g:pymode_options = 0

filetype off

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on

colorscheme distinguished
set guicursor=i-r:block-Cursor/iCursor-blinkon600-blinkoff600
set guitablabel=%f\ %M
set guitabtooltip=%F

set guioptions-=T
set guioptions-=t
set guioptions-=m

if has("gui_gtk2")
    set guifont=Source\ Code\ Pro\ Medium\ 10
else
    set guifont=Source\ Code\ Pro\ Light:h11
endif

set nobackup
set viminfo='20,\"50
set history=50
set ruler
set showmatch
set title
set showcmd
set modeline
set modelines=3

set pastetoggle=<F10>

set completeopt=menu,longest

" disable mouse pointer moving in Insert mode
set mouse=nv

" remove unwanted files out of wildmenus
set wildignore+=dist,*env,*.pyc

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
set formatoptions=crotqj

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
set ts=4 sts=4 tw=0 sw=4 expandtab smarttab smartindent autoindent cc=81

" file type defaults
au FileType tex,docbk,html setlocal tw=78
au FileType tex,docbk,html,htmldjango setlocal ts=2 sts=2 sw=2

" tag bar
if has("gui_running")
    set number
    set columns=84

    au FileType python TagbarOpen
    au FileType python set columns=125
endif

" tabs
nnoremap <C-S-t> :tabnew<CR>
inoremap <C-S-t> <Esc>:tabnew<CR>

nnoremap <A-1> 1gt
inoremap <A-1> <Esc>1gt
vnoremap <A-1> <Esc>1gt
nnoremap <A-2> 2gt
inoremap <A-2> <Esc>2gt
vnoremap <A-1> <Esc>2gt
nnoremap <A-3> 3gt
inoremap <A-3> <Esc>3gt
vnoremap <A-1> <Esc>3gt
nnoremap <A-4> 4gt
inoremap <A-4> <Esc>4gt
vnoremap <A-1> <Esc>4gt
nnoremap <A-5> 5gt
inoremap <A-5> <Esc>5gt
vnoremap <A-1> <Esc>5gt
nnoremap <A-6> 6gt
inoremap <A-6> <Esc>6gt
vnoremap <A-1> <Esc>6gt
nnoremap <A-7> 7gt
inoremap <A-7> <Esc>7gt
vnoremap <A-1> <Esc>7gt
nnoremap <A-8> 8gt
inoremap <A-8> <Esc>8gt
vnoremap <A-1> <Esc>8gt
nnoremap <A-9> 9gt
inoremap <A-9> <Esc>9gt
vnoremap <A-1> <Esc>9gt
nnoremap <A-0> 10gt
inoremap <A-0> <Esc>10gt
vnoremap <A-1> <Esc>10gt
