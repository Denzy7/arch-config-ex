set clipboard=unnamedplus
set number
set incsearch
set mouse=a
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
set tabstop=4
set shiftwidth=4
set expandtab

inoremap <silent> <Esc> <Esc>`^
inoremap <c-s> <Esc> :w<CR>
nnoremap <c-s> :w<CR>
nnoremap <leader>tn :tabnew<CR>
"close terminal w\ esc
tnoremap <Esc> <C-\><C-n>

if has('nvim')
    lua require('plugins')
endif 
