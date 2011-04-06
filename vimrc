" Load Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
set number
set guifont=Menlo\ Bold:h14
set nowrap
set go-=L
set go-=r
filetype on
filetype plugin indent on
let mapleader = ","

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
nmap <F6> <<
nmap <F7> >>
vmap <F6> <gv
vmap <F7> >gv
imap <F6> <C-T>
imap <F7> <C-D>

" Remap <ESC>
imap jj <ESC>

autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd BufNewFile, BufRead *.rss, *.atom setfiletype xml
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost *vimrc :source %

" Toggle Gundo graph
nmap <F5> :GundoToggle<CR>

" Tabular mappings
nmap <leader>; :Tab /
vmap <leader>; :Tab /

" Bubble text
nmap <M-Up> [e
nmap <M-Down> ]e
vmap <M-Up> [egv
vmap <M-Down> ]egv
