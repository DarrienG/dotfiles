set nonumber
syntax on
filetype plugin indent on
set background=dark

set tabstop=2
set shiftwidth=2        " :weary-face:

autocmd Filetype kotlin setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype yaml.ansible setlocal cursorcolumn
autocmd Filetype yaml setlocal cursorcolumn

" clang-format likes 2 spaces
au Filetype c setl sw=2 sts=2 et
au Filetype c++ setl sw=2 sts=2 et

" Spellchecking and reasonable line limits in texty files
au Filetype vimwiki,markdown,tex setl tw=80 spell spelllang=en
"au Filetype markdown setl tw=80 spell spelllang=en
"au Filetype markdown setl tw=80 spell spelllang=en

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
" Nvim on F18 has a strange BG property
if has("nvim")
    highlight Normal ctermbg=NONE
    highlight nonText ctermbg=NONE
    set inccommand=nosplit
    au TermOpen * setl ma
endif

" Disable Ex mode
:map Q <Nop>

:tnoremap <Esc> <C-\><C-n>  " remap escape to modal editor in terminal

:set mouse=r

set scrolljump=-50       " Use emacs-like scrolling in Vim

" Set terminal title to the title of the file
autocmd BufEnter * let &titlestring = ''.expand("%:t")
set title

" Equivalent of M-x delete-trailing-whitespace
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

call plug#begin('~/.vim/plugged')

" Solarized pls
Plug 'altercation/vim-colors-solarized'

" Syntax highlighting and definitions
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['go']
Plug 'ntpeters/vim-better-whitespace'

" IDE like improvements
Plug 'w0rp/ale'

" QOL Vim-wide editor improvements
Plug 'tmsvg/pear-tree'
Plug 'machakann/vim-highlightedyank'

Plug 'vimwiki/vimwiki'

" Aesthetic improvements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Dep
Plug 'tpope/vim-speeddating'
call plug#end()

set background=light
colorscheme solarized

if !has("nvim")
    let g:airline_theme = "light"
endif

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

let g:ale_rust_rls_toolchain = 'stable'

" Run Ale fixer if applicable on save
let g:ale_fix_on_save = 1

" Cycle forward on suggestions with tab abd back with shift+tab
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

" Ale checking options
let g:ale_sign_error = "✕"
let g:ale_sign_warning = "⁂"

" This will only work if using language servers
let g:ale_completion_enabled = 1
" Sane defaults that are only set like that sometimes
set completeopt=menu,menuone,preview,noselect,noinsert
" Run Ale fixer if applicable on save
let g:ale_fix_on_save = 1
" AILLINE :triumph:
let g:airline#extensions#ale#enabled = 1

let g:go_version_warning = 0

let g:ale_kotlin_ktlint_executable = "/usr/bin/ktlint"

" Set some fixers for languages
let g:ale_fixers = {
        \'*': ['remove_trailing_lines', 'trim_whitespace'],
        \'kotlin' : ['ktlint'],
        \'rust' : ['rustfmt'],
        \'cpp' : ['clang-format'],
        \'python' : ['black'],
        \'go' : ['goimports'],
        \'typescript' : ['eslint'],
        \'typescriptreact' : ['eslint'],
\}

let g:ale_linters = {
         \'rust': ['rls'],
         \'cpp': ['clangd'],
         \'c': ['clangd'],
         \'python' : ['pyls'],
         \'go': ['gopls'],
         \'typescript': ['tsserver'],
\}


let g:ale_rust_rls_toolchain = 'stable'

" Vimwiki stuff
let g:vimwiki_list = [{
            \'path' : '$HOME/documents/vimwiki/',
            \'path_html':'$HOME/developer/webdev/DarrienG.github.io/extern/',
            \'auto_export':1
\}]
