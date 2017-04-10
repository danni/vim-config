" Python-Mode
let g:pymode_rope = 0
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_lint_checkers = []
let g:pymode_lint_signs = 0
let g:pymode_folding = 0
let g:pymode_options = 0


" settings for vim-flow
let g:flow#enable = 0

" Settings for CtrlP
let g:ctrlp_open_new_file = "h"
let g:ctrlp_arg_map = 1

" Settings for NERD comment plugin
let NERDSpaceDelims = 1

" Insert python comments at the current indent level
au FileType python inoremap # X<BS>#

" Settings for ALE
let g:ale_sign_column_always = 1

" Settings for airline
let g:airline_powerline_fonts = 1

" Settings for Jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = 2

filetype off

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" close quickfix window on buffer close
au BufUnload * lclose

" Interface colours
colorscheme distinguished
set guicursor=i-r:block-Cursor/iCursor-blinkon600-blinkoff600
au BufEnter * highlight SignColumn term=underline ctermfg=243 ctermbg=235 guifg=#767676 guibg=#262626


" Set the tab labels
set guitablabel=%M%f
set guitabtooltip=%F
au BufEnter * set guitablabel=%M%f

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

set completeopt-=preview

" disable mouse pointer moving in Insert mode
set mouse=nv

" remove unwanted files out of wildmenus
set wildignore+=dist,*env,*.pyc,build,__pycache__,*_modules,main-*.css*,main-*.js*,artifacts/,static/
set wildmode=longest,list
set wildmenu

if has("syntax")
  syntax on

  " highlight trailing whitespace
  highlight BadWhitespace ctermbg=red guibg=red
  autocmd FileType * syntax match BadWhitespace /\s\+$/

  " highlight non-ascii characters
  highlight NonASCII ctermbg=green guibg=green
  autocmd FileType python syntax match NonASCII "[^\x00-\x7F]"

  " highlight special keysokay
  highlight SpecialKey ctermfg=red guifg=red
endif

" mark tabs and non-breaking spaces
set list listchars=tab:»·,nbsp:━
" draw vertical window breaks using something pretty
set fillchars+=vert:║

" format options
" :help fo-table
set formatoptions=crotqj

" editing defaults
set ts=4 sts=4 tw=0 sw=4 expandtab smarttab smartindent autoindent cc=81

" file type defaults
au FileType tex,docbk,html setlocal tw=78
au FileType tex,docbk,html,htmldjango setlocal ts=2 sts=2 sw=2

" tag bar
if has("gui_running")
    function Columns(size)
        if &columns < a:size
            let &columns=a:size
        endif
    endfunction

    set number
    au FileType * TagbarOpen
    call Columns(125)

    set spell
endif

" Relative move
nnoremap <A-C-Up> :move .-2<CR>
nnoremap <A-C-Down> :move .+1<CR>
nnoremap <A-C-Left> <<
nnoremap <A-C-Right> >>
vnoremap <A-C-Up> :move '<-2<CR>gv
vnoremap <A-C-Down> :move '>+1<CR>gv
vnoremap <A-C-Left> :<<CR>gv
vnoremap <A-C-Right> :><CR>gv

" Cut, copy and paste
vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <C-o>"+p

" tabs
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <C-o>:tabnew<CR>

nnoremap <A-1> 1gt
inoremap <A-1> <C-o>1gt
nnoremap <A-2> 2gt
inoremap <A-2> <C-o>2gt
nnoremap <A-3> 3gt
inoremap <A-3> <C-o>3gt
nnoremap <A-4> 4gt
inoremap <A-4> <C-o>4gt
nnoremap <A-5> 5gt
inoremap <A-5> <C-o>5gt
nnoremap <A-6> 6gt
inoremap <A-6> <C-o>6gt
nnoremap <A-7> 7gt
inoremap <A-7> <C-o>7gt
nnoremap <A-8> 8gt
inoremap <A-8> <C-o>8gt
nnoremap <A-9> 9gt
inoremap <A-9> <C-o>9gt
nnoremap <A-0> 10gt
inoremap <A-0> <C-o>10gt

" auto-tabulate cucumber files
au FileType cucumber inoremap <silent> <Bar>    <Bar><Esc>:call <SID>align()<CR>a

function s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

nmap :ct :ConflictTake
