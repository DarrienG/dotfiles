set number
syntax on
filetype plugin indent on
colorscheme flattened_light

set tabstop=4
set shiftwidth=4        " 4 spaces or bust

set expandtab           " Tabs are spaces - woo standards
set ruler               " Show row and line numbers

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

<<<<<<< HEAD
set scrolljump=50       " Use emacs-like scrolling in Vim
=======
:set scrolljump=50
>>>>>>> 6221248ecd944c56ed99f38759f6a066b54111f4

call plug#begin('~/.vim/plugged')

" Syntax highlighting and definitions
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'pangloss/vim-javascript'

" QOL Vim-wide editor improvements
Plug 'townk/vim-autoclose'
Plug 'machakann/vim-highlightedyank'

" New modes and Vim interfaces
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'blindFS/vim-taskwarrior'
Plug 'jceb/vim-orgmode'
" Dep
Plug 'tpope/vim-speeddating'
call plug#end()

" vim-go customizations
let g:go_fmt_command = "goimports"

