syntax on
filetype plugin indent on
colorscheme flattened_light

set tabstop=4
set shiftwidth=4        " 4 spaces or bust

" Dart is stupid
au Filetype dart setl sw=2 sts=2 et

" clang-format likes 2 spaces
au Filetype c setl sw=2 sts=2 et
au Filetype c++ setl sw=2 sts=2 et

" Spellchecking and reasonable line limits in texty files
au Filetype vimwiki setl tw=80 spell spelllang=en
au Filetype markdown setl tw=80 spell spelllang=en
au TermOpen * setl ma

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
hi CursorLine term=bold cterm=bold

" Disable Ex mode
:map Q <Nop>

" Scroll down/up without moving the cursor
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
Plug 'fatih/vim-go'

" IDE like improvements
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'

" QOL Vim-wide editor improvements
Plug 'townk/vim-autoclose'
Plug 'machakann/vim-highlightedyank'

Plug 'vimwiki/vimwiki'

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
let g:ale_sign_error = "✕"
let g:ale_sign_warning = "⁂"
" This will only work if using language servers
let g:ale_completion_enabled = 1
" AILLINE :triumph:
let g:airline#extensions#ale#enabled = 1

let g:ale_kotlin_ktlint_executable = "/usr/bin/ktlint"
" Cargo check is faster and built in
"let g:ale_rust_cargo_use_check = 1

" Set some fixers for languages
let b:ale_fixers = {
        \'*': ['remove_trailing_lines', 'trim_whitespace'],
        \'kotlin' : ['ktlint'],
        \'rust' : ['rustfmt'],
        \'c++' : ['clang-format'],
        \'c' : ['clang-format']
\}

let g:ale_linters = {'rust': ['rls']}
let g:ale_completion_enabled = 1
let g:ale_rust_rls_toolchain = 'stable'

" Run Ale fixer if applicable on save
let g:ale_fix_on_save = 1

" Vimwiki stuff
let g:vimwiki_list = [{
            \'path' : '$HOME/documents/vimwiki/',
            \'path_html':'$HOME/developer/webdev/DarrienG.github.io/extern/',
            \'auto_export':1
\}]

" neo section
if has('nvim')
    " Visually show find and replace while typing
    set inccommand=nosplit
endif
