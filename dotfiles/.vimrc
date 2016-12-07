" #### Vim Configfile

" Act like vi improved, not like vi
set nocompatible

" Set filetype to off
filetype off

" Show line numbers
set number

" Show the current line of the cursor
set cursorline

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Enable syntax highlighting
syntax enable

" Set Colorscheme
set background=dark
colorscheme solarized

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Always show the status line
set laststatus=2

" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file (may need to install ctags first)
 command! MakeTags !ctags -R .

" Nerdtree shortcut
noremap <silent> <C-n> :NERDTreeToggle<CR>

" ## Start of vundle config ##

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All mighty searcher ctrlp
Plugin 'ctrlp.vim'

" airline
Plugin 'vim-airline/vim-airline'

" indentlin
Plugin 'Yggdroot/indentLine'

" fugitive
Plugin 'fugitive.vim'

" solarized color scheme
Plugin 'Solarized'

" Syntax checking
Plugin 'Syntastic'

" vim inline treefile
Plugin 'scrooloose/nerdtree'

" Edit surroundings like ",',(),{},[]
Plugin 'tpope/vim-surround'

" Autocompletion
"Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ## End of vundle config ##

