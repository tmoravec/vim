" --- Modern Simplified Vimrc ---

" Set encoding first
set encoding=utf-8
scriptencoding utf-8

" --- General Settings ---
set nocompatible            " Use Vim defaults instead of Vi compatibility
filetype plugin indent on   " Enable filetype-specific plugins and indentation
syntax on                   " Enable syntax highlighting
set mouse=a                 " Enable mouse support
set number                  " Show line numbers
set title                   " Update terminal title
set colorcolumn=80          " Highlight the 80th column
set updatetime=1000         " Faster update time (better for Tagbar/plugins)
set hidden                  " Allow background buffers
set lazyredraw              " Faster screen redraw
set laststatus=2            " Always show status line
set wildmenu                " Enhanced command line completion
set wildmode=longest,list,full
set backspace=indent,eol,start " Sane backspace behavior

" No backup files (modern SSDs don't need these as much)
set nobackup
set noswapfile

" --- Colors & UI ---
" Enable true color support if your terminal supports it (iTerm2/modern tmux)
if has('termguicolors')
    " Fix for artifacts in tmux/some terminals (disable Background Color Erase)
    if &term =~ '256color' || $TERM =~ '256color'
        set t_ut=
    endif
    set termguicolors
endif

set background=light

" Transparent background hack (must be defined BEFORE colorscheme)
augroup transparent_background
    autocmd!
    autocmd ColorScheme pencil highlight Normal guibg=NONE ctermbg=NONE
    autocmd ColorScheme pencil highlight NonText guibg=NONE ctermbg=NONE
    autocmd ColorScheme pencil highlight LineNr guibg=NONE ctermbg=NONE
    autocmd ColorScheme pencil highlight Folded guibg=NONE ctermbg=NONE
    autocmd ColorScheme pencil highlight EndOfBuffer guibg=NONE ctermbg=NONE
augroup END

colorscheme pencil
let g:pencil_higher_contrast_ui = 1
let g:pencil_neutral_code_bg = 1

" --- GUI & Cursor ---
set guicursor=a:blinkon0       " Disable cursor blinking in all modes
if has('gui_running') || has('gui_macvim')
    set guifont=Monaco:h12
    set linespace=2            " Extra breathing room between lines
endif

" --- Tabs & Search ---
set expandtab
set shiftwidth=4
set tabstop=4
set smartcase               " Case-insensitive search unless capital used
set incsearch               " Search as you type

" Use ripgrep (rg) if available (much faster than grep)
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
    set grepformat=%f:%l:%c:%m
endif

" --- Status Line (Simplified) ---
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" --- Custom Filetypes ---
augroup filetype_overrides
    autocmd!
    autocmd BufNewFile,BufRead *.tac set filetype=python
    autocmd BufNewFile,BufRead *.twig set filetype=html
augroup END

" --- Mappings (Using non-recursive noremap) ---

" Tab switching
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew <CR>
nnoremap td :tabclose<CR>
nnoremap <C-S-Tab> :tabprev<CR>
nnoremap <C-Tab> :tabnext<CR>

" Visual line movement (treat wrapped lines as separate)
nnoremap j gj
nnoremap k gk

" Fast escape
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

" Utilities
nnoremap <leader>rts :%s/\s\+$//e<CR>
nnoremap <leader>black :!black -l 80 %<CR>
nnoremap <leader>vri :vertical resize +20<CR>
nnoremap <leader>vrd :vertical resize -20<CR>
nnoremap <leader>ssd :set syntax=diff<CR>

" Quickfix navigation
nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>

" --- Plugin Configuration ---

" Tagbar & Ctags
nnoremap <F7> :!ctags -R --exclude=.mypy_cache<CR>
let g:tagbar_sort=0

" Open tag in new tab
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Better tag navigation (g] opens selection if multiple)
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>

" NERDTree & Tagbar Toggle
nnoremap <leader>f :NERDTreeToggle<CR>:TagbarToggle<CR>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.mypy_cache/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|mypy_cache)$'

" DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
autocmd BufReadPost * :DetectIndent

" ALE
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_python_pylint_options = "-d C0103,C0111,R0903,R0201,W0613,E1101"
nnoremap <leader>al :ALELint<CR>

" C++ Syntax Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1

" Completion Menu
set completeopt=longest,menuone
set pumheight=10
