unlet! skip_defaults_vim

set nonumber
syntax on
set background=light
set termguicolors       " How the FUCk was this not on before - add true color

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab           " Tabs are spaces - woo standards

autocmd Filetype yaml.ansible setlocal cursorcolumn
autocmd Filetype yaml setlocal cursorcolumn

" clang-format likes 2 spaces
au Filetype c setl sw=2 sts=2 et
au Filetype c++ setl sw=2 sts=2 et

" Spellchecking and reasonable line limits in texty files
au Filetype vimwiki,markdown,tex setl tw=80 spell spelllang=en

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
    set inccommand=nosplit
    au TermOpen * setl ma
else
    source $VIMRUNTIME/defaults.vim
endif

" Disable Ex mode
:map Q <Nop>

:tnoremap <Esc> <C-\><C-n>  " remap escape to modal editor in terminal

:set mouse=r

set scrolljump=-50       " Use emacs-like scrolling in Vim

" Set terminal title to the title of the file
autocmd BufEnter * let &titlestring = ''.expand("%:t")
set title

call plug#begin('~/.vim/plugged')

" Let's try light again :)
Plug 'romainl/flattened'

" Syntax highlighting and definitions
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['go']
Plug 'ntpeters/vim-better-whitespace'
Plug 'rust-lang/rust.vim'

" IDE like improvements
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" QOL Vim-wide editor improvements
Plug 'tmsvg/pear-tree'
Plug 'machakann/vim-highlightedyank'
Plug 'ntpeters/vim-better-whitespace'

Plug 'vimwiki/vimwiki'

" Dep
Plug 'tpope/vim-speeddating'
call plug#end()

colorscheme flattened_light

" vim-go customizations
let g:go_fmt_command = "goimports"
let g:rustfmt_autosave = 1

" Cycle forward on suggestions with tab abd back with shift+tab
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

set updatetime=1000
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Get rid of whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
