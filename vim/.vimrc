" Stephen Nolan
" .vimrc

" Vundle Section """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " supercede legacy vi compatibility, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" **** Managed Plugins listed here

" *** examples here of compatible syntax

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'
 



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Vundle Help resources - Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" All non-vundle configuration below
" TODO consider hoisting the vundle portion out of .vimrc and into its own file
" (might want to do the same for leader mappings, color schemes, etc)


" END Vundle PORTION """"""""""""""""""""""""""""""""""""""""""""""""""


" Steve configuration below """""""""""""""""""""""""""""""""""""""""""""""""""




" Enable vim-specific functionality (that is not found in traditional Vi)
set nocompatible

" Syntax highlighting
syntax on

" Copy indent from current line when starting a new line - general 'fallback' to
" be overridden by filetype-specific indentation when available (enabled below)
set autoindent 

" Enable filetype detection if it was not yet switched on
filetype plugin on

" Load filetype-specific indent rules
filetype plugin indent on

" Relative line numbering
set relativenumber

" Highlight the current line and column
set cursorline
set cursorcolumn

" Show a guide line at column 81
set colorcolumn=81

" Show line, column, relative position in file in status line
set ruler

" General vim folding functionality - 'syntax' style may be preferrable to use on
" certain filetypes
set foldmethod=indent

" Set threshold on folding depth
" set foldnestmax=2

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

" Allow switching to another buffer without saving the current shown buffer
set hidden

" Vim 'encryption' cipher 
" Note: breakable, not appropriate for anything security-sensitive.
set cryptmethod=blowfish2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom leader mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Defined leader key
let mapleader=","

" ,b  - 'Build'  - change as appropriate for respective build process of current
" project
nnoremap <leader>b :w <Bar> :silent !clear && pdflatex latexSourceFile.tex <CR> <Bar> :redraw! <Cr>

" ,w  - Write out the file - faster than having to [shift] + ; , w , RET
nnoremap <leader>w :w <CR>

" Force update of current file when it has changed outside of vim
nnoremap <leader>e :edit <CR>

" Toggle spell checking
nnoremap <leader>s :setlocal spell! <CR>

" kj to exit INSERT mode 
" inoremap <esc> <nop>          "Force adoption of binding - worked
inoremap kj <esc>

" ,p - toggle paste mode
set pastetoggle=<leader>p

" ,hc - toggle zenburn high contrast mode
nnoremap <leader>hc :call ToggleZenburnHighContrast()<cr>

" toggle high contrast mode of Zenburn, noop for other color schemes
function! ToggleZenburnHighContrast()
    if g:zenburn_high_Contrast && g:colors_name == "zenburn"
        let g:zenburn_high_Contrast = 0
        colorscheme zenburn
        hi ColorColumn ctermbg=lightgrey guibg=lightgrey
    elseif !g:zenburn_high_Contrast && g:colors_name == "zenburn"
        let g:zenburn_high_Contrast = 1
        colorscheme zenburn
        hi ColorColumn ctermbg=lightgrey guibg=lightgrey
    endif
endfunction

" ,jf  - Call eclim format on entire current buffer - only applies to .java
" files
autocmd FileType java nnoremap <leader>jf :%JavaFormat


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim will try to use colors that look good on a dark or light background
"set background=light
set background=dark

" Colorscheme
"colorscheme jellybeans
"colorscheme solarized
colorscheme gruvbox


" Zenburn
"let g:zenburn_high_Contrast=0   " Toggles high-contrast mode
let g:zenburn_high_Contrast=1   " Toggles high-contrast mode
"colorscheme zenburn

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

" Miscellaneous below """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" youcompleteme configuration
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1


" Eclim  configuration
let g:EclimCompletionMethod = 'omnifunc'
