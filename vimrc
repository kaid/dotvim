filetype on
filetype plugin indent on
let mapleader = ","
set guioptions-=T
set number

" Show hiden characters
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Indentation setting.
set ts=2 sts=2 sw=2 expandtab
set cindent
"" Emulating Textmate's quick indentation.
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
imap <D-[> <C-T>
imap <D-]> <C-D>

" Remap <ESC>
imap jj <ESC>

autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd BufNewFile, BufRead *.rss, *.atom setfiletype xml
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost *vimrc :source %

" Load Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
