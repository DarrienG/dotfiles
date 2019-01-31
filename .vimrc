syntax on
filetype plugin indent on
colorscheme flattened_light

set tabstop=4
set shiftwidth=4        " 4 spaces or bust

" Dart is stupid
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

" Equivalent of M-x delete-trailing-whitespace
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

call plug#begin('~/.vim/plugged')

" Syntax highlighting and definitions
Plug 'sheerun/vim-polyglot'

" IDE like improvements
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'

" QOL Vim-wide editor improvements
Plug 'townk/vim-autoclose'
Plug 'machakann/vim-highlightedyank'

" New modes and Vim interfaces
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'jceb/vim-orgmode'

" Aesthetic improvements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Dep
Plug 'tpope/vim-speeddating'
call plug#end()

" vim-go customizations
let g:go_fmt_command = "goimports"

" Patch airline to use more standard unicode glyphs
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Ale checking options
let g:ale_sign_error = "❌"
let g:ale_sign_warning = "⁂"
" This will only work if using language servers
let g:ale_completion_enabled = 1
" AILLINE :triumph:
let g:airline#extensions#ale#enabled = 1

let g:ale_kotlin_ktlint_executable = "/usr/bin/ktlint"
let g:ale_rust_cargo_use_check = 1

let b:ale_fixers = {'kotlin': ['ktlint']}
