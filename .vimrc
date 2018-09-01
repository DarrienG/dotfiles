set number
syntax on
filetype plugin indent on
colorscheme flattened_light

set tabstop=4
set shiftwidth=4        " 4 spaces or bust

au Filetype dart setl sw=2 sts=2 et

set expandtab           " Tabs are spaces - woo standards
set ruler               " Show row and line numbers

set nonu                " No NUMBERS

set wildmenu            " visual autocomplete for command menu
                        " Ignore files Vim will never read
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.class

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set showcmd             " show command in bottom bar
set lazyredraw          " redraw only when we need to.

" Sets the current line to be highlighted
:set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Disable Ex mode
:map Q <Nop>            

:nnoremap J <C-e>
:nnoremap K <C-y> 

:tnoremap <Esc> <C-\><C-n>  " remap escape to modal editor in terminal

:set mouse=r

set scrolljump=-50       " Use emacs-like scrolling in Vim

" Set terminal title to the title of the file
autocmd BufEnter * let &titlestring = ''.expand("%:t")
set title

call plug#begin('~/.vim/plugged')

" Syntax highlighting and definitions
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'pangloss/vim-javascript'
Plug 'dart-lang/dart-vim-plugin'

" QOL Vim-wide editor improvements
Plug 'townk/vim-autoclose'
Plug 'machakann/vim-highlightedyank'

" New modes and Vim interfaces
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'jceb/vim-orgmode'

" IDE-type enhancements
Plug 'lifepillar/vim-mucomplete'

" Aesthetic improvements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Dep
Plug 'tpope/vim-speeddating'
call plug#end()

" vim-go customizations
let g:go_fmt_command = "goimports"

" Autocomplete changes
set completeopt-=preview
set completeopt+=longest,menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

