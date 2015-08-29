set nocompatible
filetype off
"Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Plugins
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'https://github.com/msanders/snipmate.vim'

call vundle#end()


syntax on
filetype plugin indent on
autocmd! bufwritepost .vimrc source %
colorscheme hybrid


"sets
set ttyfast
set hlsearch
set scrolloff=5
set undofile
set history=10000
set undolevels=1000
set backup
set writebackup
set directory=~/.vim/tmp/swap/
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set relativenumber
set splitbelow
set splitright
set smartcase
set hidden
set matchpairs+=<:>
set tabstop=4
set shiftwidth=4

"mappings
let mapleader = "\<Space>"
noremap <leader>= :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.android/*,*/.cache/*,*/.eclim/*,*/.eclipse/*,*/msp430/*,*/.config/*

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

"eclim settings
let g:EclimPythonValidate = 0

"Syntastic settings
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_pylint_exec = 'python3-pylint'
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
