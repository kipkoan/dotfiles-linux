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
