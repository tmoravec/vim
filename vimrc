" First of all load Pathogen
call pathogen#infect()

" Gvim...
if has('gui_running')
    set guicursor+=a:blinkon0
    set guifont=DejaVu\ Sans\ Mono\ 8
    set lines=999 columns=999
    set guioptions-=T

    "toggle menubar on C-S-N
    nnoremap <silent> <C-S-N> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

endif

" Solarized colorscheme
set bg=dark
"colo xoria256
let g:solarized_contrast="high"
colo solarized
"colo default

" required in GNU Screen
set t_Co=256

" Toggle dark/light background on F4
call togglebg#map("<F4>")

" Disable beep and screen flash
set noerrorbells visualbell t_vb=
if has("autocmd")
  autocmd GUIEnter * set visualbell t_vb=
endif

" Syntax highlighting and column for 80 cols
syntax on
set textwidth=80
set colorcolumn=+0
hi ColorColumn ctermbg=black
hi ColorColumn guibg=black

" Tabs switching
map th :tabprev<CR>
map tl :tabnext<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

" Enable mouse
set mouse=a

" Indetnation
set smartindent
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start

" Line numbers
set number

" Show status line always
set laststatus=2

" Incremental search
set incsearch

" Code folding (za)
set foldmethod=indent
set foldlevel=99

" Remove trailing spaces on exit
autocmd BufWritePre * :%s/\s\+$//e

" Filetype plugin and omnifunc autocomplete (C-<space>)
filetype plugin on
filetype indent plugin on
setlocal ofu=syntaxcomplete#Complete
set completeopt=menu

" .tac files are Python
au BufNewFile,BufRead *.tac set filetype=python

" .conver files are Python
au BufNewFile,BufRead *.cover set filetype=python

" NERDTree on <leader>n
map <leader>n :NERDTreeToggle<CR>

" Taglist - F7 for update, F8 for toggle
nnoremap <silent> <F7> :!ctags -R<CR>
let g:tagbar_sort = 0
map <leader>t :TagbarToggle<CR>
" Update tag[list|bar] position every second
set updatetime=1000

"TList on right
let Tlist_Use_Right_Window = 1

"open tag in a new tab on Ctrl-\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"Run script on CTRL+M and check syntax on CTRL+L
autocmd FileType php map <C-M> :w!<CR>:!/usr/bin/php %<CR>
autocmd FileType php map <C-L> :w!<CR>:!/usr/bin/php -l %<CR>
autocmd FileType tex map <C-M> :w!<CR>:!pdflatex %<CR>
autocmd FileType py map <C-M> :w!<CR>:!/usr/bin/python %<CR>
autocmd FileType python map <C-M> :w!<CR>:!/usr/bin/python %<CR>

" Enable Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Disable pymode lint, we already use syntastic
let g:pymode_lint = 0

" Syntastic in statusline
set statusline=%<%f\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P

" Supertab
"let g:SuperTabDefaultCompletionType="context"

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" GIT
map <leader>gc :!git commit %<CR>
map <leader>gca :!git commit -a<CR>
map <leader>gpl :!git pull<CR>
map <leader>gps :!git push<CR>

" Overwrite devault <leader>n - I use this for NERDTree.
let g:jedi#related_names_command = ""
