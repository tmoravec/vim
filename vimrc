call pathogen#infect()

" solarized
"if has("gui_running")
"    let g:solarized_contrast="high"
"else
"    let g:solarized_termcolors=256
"endif
"let g:solarized_contrast="high"
"colo solarized
colo pencil

" Highlight 79th column
set colorcolumn=79

" Tabs switching
map th :tabprev<CR>
map <C-S-Tab> :tabprev<CR>
map tl :tabnext<CR>
map <C-Tab> :tabnext<CR>
map tn :tabnew <CR>
map td :tabclose<CR>

" Enable mouse
set mouse=a

" Make it a sane editor
set incsearch
set number
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set copyindent
set smartcase
set title
set wildmode=longest,list,full
set wildmenu
set lazyredraw

" no backup files
set nobackup
set noswapfile

" Show status line always
set laststatus=2

" Some info in the status line
set statusline=%<%f\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P

" remove trailing space
map <leader>rts :%s/\s\+$//e<CR>

" Set syntax to diff
map <leader>ssd :set syntax=diff<CR>

" Don't search in tags file
set grepprg=grep\ -n\ --exclude=tags\ $*\ /dev/null

" Detect file types
filetype plugin on
filetype indent plugin on
setlocal ofu=syntaxcomplete#Complete
syntax on

" .tac files are Python
au BufNewFile,BufRead *.tac set filetype=python

" Tagbar
map <leader>t :TagbarToggle<CR>
set updatetime=1000
map <F7> :!ctags -R<CR>
let g:tagbar_sort=0

" Open tag in new tab on C-\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" by default show tag selection on multiple options
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
vnoremap g<C-]> <C-]>


" This is a must :-)
map <C-c> <Esc>

" GUI options
set guicursor+=a:blinkon0
set guifont=Menlo\ Regular:h11
set guioptions-=T
set guioptions-=m
set guioptions+=LlRrb
set guioptions-=LlRrb
set linespace=2

" CtrlP settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Vim Completer settings
let g:kompleter_replace_standard_mappings = 0

" Context aware SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" but disable the preview pane
set completeopt-=preview

" DetectIndent settings
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_cpp_compiler_options = '-std=c++11'

" open NERDTree
map <leader>f :NERDTreeToggle<CR>

" 256 colors in screen/tmux
set t_Co=256

" Enable RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" additional vim c++ syntax highlighting
let g:cpp_class_scope_highlight = 1

map <leader>j :cn<CR>
map <leader>k :cp<CR>

" Set syntax to diff
map <leader>ssd :set syntax=diff<CR>

set encoding=utf-8
