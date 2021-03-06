" Custom Settings

" use space as `<Leader>`
let mapleader = "\<space>"

let g:indentLine_char = '┆'
let g:indentLine_color_gui = '#444444'
let g:indentLine_color_gui = '#494040'

let g:spacevim_default_indent = 4

let g:syntastic_python_python_exec = 'python3'

set gdefault
set ignorecase
set list
set listchars+=eol:⌏,tab:▸\ ,trail:·,nbsp:·
set showcmd
set timeoutlen=250


" Bind <leader>y to forward last-yanked text to Clipper
nnoremap <leader>y :call system('nc -q0 localhost 8377', @0)<CR>
