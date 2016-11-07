" Stephen Nolan
" .vimrc

" Enable vim-specific functionality (that is not found in traditional Vi)
set nocompatible

" Syntax highlighting
syntax on

" Enable filetype detection if it was not yet switched on
filetype plugin on

" Load filetype-specific indent rules
filetype plugin indent on

" Relative line numbering
set relativenumber

" Highlight the current line
set cursorline

" Show a guide line at column 81
set colorcolumn=81

" Show line, column, relative position in file in status line
set ruler

" Number of tabs that can be opened with $ vim -p (default is ~8)
set tabpagemax=60

" Always show status bar, even when editing one file
set laststatus=2

" Bash - like completion for filenames
set wildmode=longest,list,full
set wildmenu

" Yank to system clipboard when possible
set clipboard=unnamedplus

" Encoding and end-of-line
set encoding=utf8
set fileformats=unix,dos,mac

" Allow incrementing of 'alpha' glyphs (A, B, etc) in addition to octal, hex,
" decimal numbers
set nrformats+=alpha

" Insert spaces to 'make' a 'tab'
set expandtab

" Insert blanks according to [shiftwidth]
set smarttab

" # of spaces to use for each (auto)indent
set shiftwidth=4

" # of spaces that a <Tab> in the file counts for
set tabstop=4

" Keep a 'buffer' of lines around the cursor when near the edge of screen
set scrolloff=5

" Copy indent from current line when starting a new line
set autoindent "Auto indent

" 256 color terminal
set t_Co=256

" Maximum width of text that is being inserted
set textwidth=80
set formatoptions+=t

" Blink matching () [] {} on typing them
set showmatch

" Start showing matches while typing out a search pattern
set incsearch

" When a file has been detected to have been changed outside of Vim and it 
" has not been changed inside of Vim, automatically read it again
set autoread


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"My defined leader key
let mapleader=","


" ,b  - 'Build' to build/compile/run tests of whatever I'm doing
nnoremap <leader>b :w <Bar> !clear && pdflatex Homework10.tex && evince Homework10.pdf

" ,w  - Write out the file - faster than having to [shift] + ; , w , RET
nnoremap <leader>w :w <CR>

" Force update of current file when it has changed outside of vim
nnoremap <leader>e :edit <CR>

" Toggle spell checking
nnoremap <leader>s :setlocal spell! <CR>

" kj to exit INSERT mode 
" inoremap <esc> <nop>          "Force adoption of binding
inoremap kj <esc>

" ,p - toggle paste mode
set pastetoggle=<leader>p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim will try to use colors that look good on a dark or light background
"set background=light
set background=dark

" Colorscheme
"colorscheme jellybeans
"colorscheme solarized


" Zenburn
let g:zenburn_high_Contrast=0   " Toggles high-contrast mode
" let g:zenburn_high_Contrast=1   " Toggles high-contrast mode
colorscheme zenburn

" toggles the *color* of the colorcol
" in situations where the terminal/color scheme auto-sets it to something
" not fully desirable (for instance bright red)
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Enable mouse on a machine with X-server
"set mouse=a

" Return to last edit position when opening files (remember cursor location 
" between edits)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"" set omnifunc=syntaxcomplete#Complete

