set clipboard=unnamedplus
set number
set incsearch
set mouse=a

"indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
filetype indent on

"paste indent
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

inoremap <silent> <Esc> <Esc>`^
inoremap <c-s> <Esc> :w<CR>
nnoremap <c-s> :w<CR>
nnoremap <leader>tn :tabnew<CR>
"close terminal w\ esc
tnoremap <Esc> <C-\><C-n>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if has('nvim')
    lua require('plugins')
endif 
