" Python-Mode

" settings for vim-flow
let g:flow#enable = 0

" Settings for CtrlP
let g:ctrlp_open_new_file = "h"
let g:ctrlp_arg_map = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Settings for NERD comment plugin
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {'python': {'left': '#'}}

" Settings for ALE
let g:ale_sign_column_always = 1

" Settings for airline
let g:airline_powerline_fonts = 1

" Settings for completor
let g:completor_python_binary = '/usr/local/bin/python3'

" Settings for vim-jsx
let g:jsx_ext_required = 0

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

" menu settings
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

  " highlight special keys
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
vnoremap <A-C-Up> :move '<-2<CR>gv
vnoremap <A-C-Down> :move '>+1<CR>gv
" Indent/dedent
nnoremap <S-TAB> <<
nnoremap <TAB> >>
vnoremap <S-TAB> <gv
vnoremap <TAB> >gv
nmap # <plug>NERDCommenterToggle
vmap # <plug>NERDCommenterToggle gv

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

" Omni complete as Ctrl-Space
inoremap <expr> <C-Space> pumvisible() ? "\<C-n>\<C-y>" : "<C-R>=completor#do('complete')<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>\<C-y>" : "\<Tab>"
" imap <C-@> <C-Space>

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
