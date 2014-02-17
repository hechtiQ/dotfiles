syntax on
filetype plugin indent on
autocmd! bufwritepost .vimrc source %
colorscheme hybrid

"Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Bundles
Bundle 'edkolev/tmuxline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'


"sets
set ttyfast
set hlsearch
set scrolloff=5
set undofile
set history=10000
set undolevels=1000
set backup
set writebackup
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set relativenumber
set splitbelow
set splitright
set smartcase
set hidden

"mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
command! Q q
command! W w
if has("gui_running")
	" C-Space seems to work under gVim on both Linux and win32
	inoremap <C-Space> <C-n>
else " no gui
	if has("unix")
		inoremap <Nul> <C-n>
	else
	endif
endif

"Tmuxline settings
			"\'c'    : '#H',
let g:tmuxline_preset= {
			\'a'    : '#S',
			\'b'    : '#W',
			\'win'  : '#I #W',
			\'cwin' : '#I #W',
			\'x'    : '♡#(sh ~/scripts/battery)',
			\'y'    : ['%R', '%a', '%Y']}
let g:tmuxline_powerline_separators = 1

"Ctrl-p settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1

"airline settings
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
