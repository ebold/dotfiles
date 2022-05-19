" ---------------------------------------------------------------------------- "
" IMPORTANT NOTICE
"
" Prerequisites: installation of 'curl' and 'vim'
"
" Install a full version of vim with 'sudo apt install vim' if you get
" a following error after installing vim-plug:
"
" E319: Sorry, the command is not available in this version: call plug#begin('~/.vim/plugged')
"
" ---------------------------------------------------------------------------- "

" Disable compatability with old vi
set nocompatible

" ---------------------------------------------------------------------------- "
" Automatic installation of vim-plug                                           "
" -----------------------------------------------------------------------------"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" ---------------------------------------------------------------------------- "
" Plugins                                                                      "
" ---------------------------------------------------------------------------- "

call plug#begin('~/.vim/plugged')

" Automatic installation of missing plugins on startup

if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

Plug 'altercation/vim-colors-solarized'

Plug 'ap/vim-buftabline'
Plug 'ciaranm/detectindent'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf',                        { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'moll/vim-bbye'
Plug 'sheerun/vim-polyglot'
"Plug 'shougo/vimproc',                      { 'do': 'make' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
Plug 'ajh17/vimcompletesme'

Plug 'chiel92/vim-autoformat',              { 'on': 'Autoformat' }
"Plug 'majutsushi/tagbar',                   { 'on': 'TagbarToggle' }

Plug 'vim-scripts/doxygentoolkit.vim',      { 'for': 'cpp' }
"Plug 'jdevlieghere/llvm.vim',               { 'for': 'llvm' }
"Plug 'racer-rust/vim-racer',                { 'for': 'rust' }
Plug 'lervag/vimtex',                       { 'for': 'tex' }

" NERD tree will be loaded on the first invocatio of NERDTreeToggle command
Plug 'scrooloose/nerdtree',                 {'on': 'NERDTreeToggle'}

"TabNine autocompletion"
"Plug 'zxqfl/tabnine-vim'

"You complete me, YCM"
Plug 'ycm-core/YouCompleteMe'

"Vim dispatch"
Plug 'tpope/vim-dispatch'

call plug#end()

" ---------------------------------------------------------------------------- "
" General Settings                                                             "
" ---------------------------------------------------------------------------- "

filetype plugin indent on

if !exists("g:syntax_on")
    syntax enable
endif

" solarized
try
    let g:solarized_termtrans=1 "this fixed grey background in xterm-256color
    colorscheme solarized
catch
endtry

set autoread                    " Auto reload file after external command
set background=dark             " Use a dark background
set backspace=indent,eol,start  " Delete over line breaks
set binary                      " Enable binary support
set colorcolumn=80,120          " Show ruler columns
set encoding=utf-8              " Use UTF-8 encoding
set hidden                      " Hide buffers instead of closing them
set laststatus=2                " Always display the status line
set nofoldenable                " Disable folding
set lazyredraw                  " Use lazy redrawing
set noshowmode                  " Don't show mode
set number                      " Show line numbers
set pastetoggle=<F2>            " Toggle paste mode with F2
set ruler                       " Show ruler
set showcmd                     " Show current command
set showmatch                   " Show matching bracket/parenthesis/etc
set showmode                    " Show current mode
set tags=tags;                  " Find tags recursively
set title                       " Change terminal title
set ttyfast                     " Fast terminal
set wildmenu                    " Visual autocomplete for command menu
set clipboard^=unnamed,unnamedplus
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file

" Search
set incsearch                   " Incremental search
set hlsearch                    " Highlight matches
set ignorecase                  " Case-insensitive search...
set smartcase                   " ...unless search contains uppercase letter

" Indentation
set smarttab                    " Better tabs
set smartindent                 " Insert new level of indentation
set autoindent                  " Copy indentation from previous line
set tabstop=2                   " Columns a tab counts for
set softtabstop=2               " Columns a tab inserts in insert mode
set shiftwidth=2                " Columns inserted with the reindent operations
set shiftround                  " Always indent by multiple of shiftwidth
set expandtab                   " Always use spaces instead of tabs

" Key sequence timeout
set ttimeout                    " Enable time out
set ttimeoutlen=0               " Disable key code delay

" Wrapping
set nowrap                      " Don't wrap long lines
set linebreak                   " When wrapping, only at certain characters
set textwidth=0                 " Turn off physical line wrapping
set wrapmargin=0                " Turn off physical line wrapping

" Joining
set nojoinspaces                " Only one space when joining lines
set formatoptions+=j            " Remove comment leader when joining lines

" Scroll
set sidescrolloff=3             " Keep at least 3 lines left/right
set scrolloff=3                 " Keep at least 3 lines above/below

" Mouse
set mousehide                   " Hide mouse when typing
set mouse=nicr                  " Disable mouse

" Disable bell
set visualbell                  " Disable visual bell
set noerrorbells                " Disable error bell

" Treat given characters as a word boundary
set iskeyword-=.                " Make '.' end of word designator
set iskeyword-=#                " Make '#' end of word designator

" Splits
set splitbelow                  " Horizontal split below
set splitright                  " Vertical split right

" Spell checking
set spelllang=en_us             " English as default language
set spell                       " Enable by default

" Invisible characters
set nolist
set listchars=eol:¬,tab:▶\ ,trail:~,extends:⟩,precedes:⟨,nbsp:␣
set showbreak=↳\ \ \ "

" Make completion menu behave like an IDE
set completeopt=longest,menuone,preview

" Encryption
if has("crypt-blowfish2")
    set cm=blowfish2
endif

" History
set history=1000                " Remember more commands
if has('persistent_undo')
    set undofile                " Persistent undo
    set undodir=~/.vim/undo     " Location to store undo history
    set undolevels=1000         " Max number of changes
    set undoreload=10000        " Max lines to save for undo on a buffer reload
endif

" ---------------------------------------------------------------------------- "
" Colors & User Interface                                                      "
" ---------------------------------------------------------------------------- "

if has("gui_running")
    set guifont=Source\ Code\ Pro\ Medium:h13
    set antialias
end

" Same color for sign column and line numbers
highlight clear SignColumn

" Custom spell-checking highlighting
highlight SpellBad     term=underline cterm=underline
highlight SpellCap     term=underline cterm=underline
highlight SpellRare    term=underline cterm=underline
highlight SpellLocal   term=underline cterm=underline

" Tab line
highlight TabLine      ctermfg=White  ctermbg=Black     cterm=NONE
highlight TabLineFill  ctermfg=White  ctermbg=Black     cterm=NONE
highlight TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" ---------------------------------------------------------------------------- "
" Key Mappings                                                                 "
" ---------------------------------------------------------------------------- "

" Typos
cnoreabbrev E e
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev W w

" Save file which you forgot to open with sudo
cnoremap w!! w !sudo tee % >/dev/null

" Wrap the current visual selection
vnoremap Q gq

" Wrap the current paragraph
nnoremap Q gqap

" Search for current visual selection
vnoremap // y/\V<C-R>"<CR>

" Move between open buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Redraw the screen and remove highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" ---------------------------------------------------------------------------- "
" Leader Mappings                                                              "
" ---------------------------------------------------------------------------- "
let mapleader=" "

" Clear search highlight
nnoremap <leader><space> :noh<CR>

" Yank
nnoremap <leader>yf :let @+=expand("%:p")<CR>
nnoremap <leader>yl :let @+=expand('%:t') . ':' . line(".")<CR>

" Toggle
nnoremap <leader>ts :setlocal spell!<CR>
nnoremap <leader>tl :set list!<CR>
nnoremap <leader>tw :call ToggleRemoveTrailingWhitespace()<CR>

" Buffers
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Windows
nnoremap <leader>wd <C-w>c
nnoremap <leader>wo <C-w>o

" ---------------------------------------------------------------------------- "
" Functions                                                                    "
" ---------------------------------------------------------------------------- "

function! ToggleRemoveTrailingWhitespace()
  if exists("g:dont_remove_trailing_whitespace")
    unlet g:dont_remove_trailing_whitespace
    echo "Enabled removing trailing whitespace"
  else
    let g:dont_remove_trailing_whitespace=1
    echo "Disabled removing trailing whitespace"
  endif
endfunction

function! RemoveTrailingWhitespace()
  if !exists("g:dont_remove_trailing_whitespace")
    %s/\s\+$//e
  endif
endfunction

" ---------------------------------------------------------------------------- "
" Auto Commands                                                                "
" ---------------------------------------------------------------------------- "

" Extension specific commands
augroup extensions
    autocmd!
    autocmd BufNewFile,BufRead *.mm setlocal filetype=objcpp
augroup end

" Filetype specific commands
augroup filtypes
    autocmd!
    autocmd FileType c,cpp setlocal comments^=:///
    autocmd FileType c,cpp setlocal commentstring=///\ %s
    autocmd FileType crontab setlocal nobackup nowritebackup
augroup end

" Remove trailing whitespace
augroup remove_trailing_whitespace
    autocmd!
    autocmd BufWritePre * :call RemoveTrailingWhitespace()
augroup end

" Watch my .vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end

" ---------------------------------------------------------------------------- "
" Plugin Configuration                                                         "
" ---------------------------------------------------------------------------- "
" NERDTree
" [Ctrl+n] - toggle file navigation
map <C-n> :NERDTreeToggle<CR>

" vim-bbye
nnoremap <silent> <leader>bd :Bdelete!<CR>

" vim-signify
let g:signify_vcs_list=['git']
let g:signify_update_on_bufenter=0

" fzf.vim
let g:fzf_buffers_jump=1
nnoremap \ :Rg<SPACE>
vnoremap _ y :Rg <C-R>"<CR>
nnoremap _ yaw :Rg <C-R>"<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>

" vim-lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" detectindent
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=2

augroup detect_indent
    autocmd!
    autocmd BufReadPost * :DetectIndent
augroup end

" tagbar
let g:tagbar_autofocus=0
let g:tagbar_compact=1
let g:tagbar_right=1
let g:tagbar_width=35
nnoremap <leader>tt :TagbarToggle<CR>

" vim-autoformat
let g:formatters_python=['yapf', 'autopep8']
let g:formatter_yapf_style='pep8'

" doxygentoolkit.vim
let g:DoxygenToolkit_commentType="C++"

" LSP
let g:lsp_signs_enabled=1
nnoremap <leader>ld :LspDefinition<CR>
nnoremap <leader>lf :LspDocumentFormat<CR>
nnoremap <leader>lh :LspHover<CR>
nnoremap <leader>lr :LspReferences<CR>

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
elseif  executable('cquery')
    augroup lsp_cquery
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'cquery',
                    \ 'cmd': {server_info->['cquery']},
                    \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                    \ 'initialization_options': { 'cacheDirectory': '/tmp/cache' },
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

if executable('pyls')
    augroup lsp_pyls
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'pyls',
                    \ 'cmd': {server_info->['pyls']},
                    \ 'whitelist': ['python'],
                    \ })
        autocmd FileType python setlocal omnifunc=lsp#complete
    augroup end
endif

" vim-dispatch

" Open quickfix window and scroll to bottom
" [Ctrl+m] + m  - open quickfix window
nnoremap    <C-m>m    :copen<CR> <bar> G
" Build/clean debug and release targets
" [Ctrl+m] + b   - build a debug and release binaries
" [Ctlr+m] + b+d - build a debug binary
" [Ctrl+m] + c   - clean a debug and release binaries
" [Ctrl+m] + c+d - clean a debug binary
nnoremap    <C-m>b    :Dispatch! make -C build/debug; make -C build/release<CR>
nnoremap    <C-m>bd   :Dispatch! make -C build/debug<CR>
nnoremap    <C-m>br   :Dispatch! make -C build/release<CR>
nnoremap    <C-m>c    :Dispatch! make clean -C build/debug; make clean -C build/release<CR>
nnoremap    <C-m>cd   :Dispatch! make clean -C build/debug<CR>

" YCM configuration [2]

" Mapping to close the completion menu (default <C-y>)
"let g:ycm_key_list_stop_completion = ['<C-x>']

" Set filetypes where YCM will be turned on
"let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0                 " Don't confirm python conf
let g:ycm_always_populate_location_list = 1      " Always populae diagnostics list
let g:ycm_enable_diagnostic_signs = 1            " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1          " Open location list to view diagnostics

let g:ycm_max_num_candidates = 20                " Max number of completion suggestions
let g:ycm_max_num_identifier_candidates = 10     " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                       " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                 " Show diagnostic display features
let g:ycm_error_symbol = '>>'                    " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1            " Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1     " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1            " Echo line's diagnostic that cursor is on

" -----------------------------------------------------------------------------"
" External links
" -----------------------------------------------------------------------------"
"
" [1] For A Barebones Starter Config
"     https://devel.tech/snippets/n/vIMmz8vZ/minimal-vim-configuration-with-vim-plug/
"
" [2] Setting up a Build System and Code Completion for C and C++
"     https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1
