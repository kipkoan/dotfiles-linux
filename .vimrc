" Include Jermey Mack (@mutewinter) vimrc
source ~/.vim/vimrc

" Custom Settings
set cursorline
set gdefault
set listchars+=tab:▸\ ,trail:·,nbsp:·
set numberwidth=5
set relativenumber
set showcmd
set ttyfast
set ignorecase

" Custom Colors
hi ColorColumn ctermbg=234 guibg=#333333
hi CursorLine ctermbg=232 guibg=#060606
hi LineNr ctermbg=234 ctermfg=241 guifg=#777777 guibg=#292929
hi Normal guibg=#171717

" Remove Bindings
iunmap jk
iunmap JK
iunmap jK
iunmap Jk

" Add Bindings
nnoremap <leader>b :CtrlPBuffer<CR>

" Bind <leader>y to forward last-yanked text to Clipper
nnoremap <leader>y :call system('nc -q0 localhost 8377', @0)<CR>

let g:python_host_prog = '/home/kipm/.pyenv/versions/2.7.9/bin/python'
let g:python3_host_prog = '/home/kipm/.pyenv/versions/3.4.2/bin/python'
let g:ycm_path_to_python_interpreter = '/home/kipm/.pyenv/versions/2.7.9/bin/python'
