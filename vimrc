runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

colorscheme distinguished
set guifont=Source\ Code\ Pro\ Medium\ 10
set guicursor=i-r:block-Cursor/iCursor-blinkon600-blinkoff600

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
