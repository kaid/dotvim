" Load Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on

set guifont=Menlo\ Bold:h14

filetype on
filetype plugin indent on

let mapleader = ","
set number

if has("gui_running")
  colorscheme solarized
  set fuopt+=maxhorz
  map <leader>f :set invfu<CR>
  set go-=T
endif

" Statusline setting
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{fugitive#statusline()}

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
set nowrap
set go-=L
set go-=r
