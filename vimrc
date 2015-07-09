" settings for python-mode
let g:pymode_run = 0
let g:pymode_lint_checkers = ["pep8","pylint"]
let g:pymode_rope_completion_bind = '<C-n>'
let g:pymode_folding = 0
let g:pymode_lint_ignore = "F0401"
let g:pymode_lint_signs = 0
let g:pymode_lint_mccabe_complexity = 10
let g:pymode_options = 0

filetype off

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" close quickfix window on buffer close
au BufUnload * lclose

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
set wildmode=longest,list,full
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
au FileType less nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR>

" tag bar
if has("gui_running")
    function Columns(size)
        if &columns < a:size
            let &columns=a:size
        endif
    endfunction

    set number
    call Columns(84)

    au FileType python TagbarOpen
    au FileType python call Columns(125)
endif

" tabs
nnoremap <C-S-t> :tabnew<CR>
inoremap <C-S-t> <Esc>:tabnew<CR>

nnoremap <A-1> 1gt
inoremap <A-1> <Esc>1gti
vnoremap <A-1> <Esc>1gtv
nnoremap <A-2> 2gt
inoremap <A-2> <Esc>2gti
vnoremap <A-1> <Esc>2gtv
nnoremap <A-3> 3gt
inoremap <A-3> <Esc>3gti
vnoremap <A-1> <Esc>3gtv
nnoremap <A-4> 4gt
inoremap <A-4> <Esc>4gti
vnoremap <A-1> <Esc>4gtv
nnoremap <A-5> 5gt
inoremap <A-5> <Esc>5gti
vnoremap <A-1> <Esc>5gtv
nnoremap <A-6> 6gt
inoremap <A-6> <Esc>6gti
vnoremap <A-1> <Esc>6gtv
nnoremap <A-7> 7gt
inoremap <A-7> <Esc>7gti
vnoremap <A-1> <Esc>7gtv
nnoremap <A-8> 8gt
inoremap <A-8> <Esc>8gti
vnoremap <A-1> <Esc>8gtv
nnoremap <A-9> 9gt
inoremap <A-9> <Esc>9gti
vnoremap <A-1> <Esc>9gtv
nnoremap <A-0> 10gt
inoremap <A-0> <Esc>10gti
vnoremap <A-1> <Esc>10gtv

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
