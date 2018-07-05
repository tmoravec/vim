call pathogen#infect()

" 256 colors in screen/tmux
set t_Co=256
set term=screen-256color

let g:solarized_termcolors = 256
let g:pencil_higher_contrast_ui = 0
colo pencil
set bg=light
" Highlight 79th column
set colorcolumn=80

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
set statusline=%<%f\ %h%m%r%#warningmsg#%*%=%-14.(%l,%c%V%)\ %P

" remove trailing space
map <leader>rts :%s/\s\+$//e<CR>

" quick resize
map <leader>vri :vertical resize +20<CR>
map <leader>vrd :vertical resize -20<CR>

" Set syntax to diff
map <leader>ssd :set syntax=diff<CR>

" Don't search in tags file
set grepprg=grep\ -n\ -i\ -R\ --exclude=tags\ --exclude=\*.ipynb\ --exclude=\*.pyc\ $*\ **/*\ /dev/null

" Detect file types
filetype plugin on
filetype indent plugin on
setlocal ofu=syntaxcomplete#Complete
syntax on

" .tac files are Python
au BufNewFile,BufRead *.tac set filetype=python

" .twig files are HTML
au BufNewFile,BufRead *.twig set filetype=html

" Tagbar
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

" Completion settings
"
" Disable the preview pane on completion (completeopt without 'preview')
set completeopt=longest,menuone
set complete=.,],w,b,u,U
"
" Height of the complete menu.
set pumheight=10

" DetectIndent settings
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" ALE
" let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_lint_on_enter = 0
" let g:ale_linters = {
" \   'python': ['pylint'],
" \}
let g:ale_python_pylint_options = "-d C0103,C0111,R0903,R0201,W0613,E1101"

" open NERDTree and Tagbar
map <leader>f :NERDTreeToggle<CR>:TagbarToggle<CR>

" Enable RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" additional vim C++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1


map <leader>j :cn<CR>
map <leader>k :cp<CR>

" Set syntax to diff
map <leader>ssd :set syntax=diff<CR>

set encoding=utf-8

map j gj
map k gk
