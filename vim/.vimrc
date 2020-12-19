" .vimrc
" Steve Nolan


" Vundle Section """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"   set nocompatible              " supercede legacy vi compatibility, required
"   filetype off                  " required
"   
"   " set the runtime path to include Vundle and initialize
"   set rtp+=~/.vim/bundle/Vundle.vim
"   call vundle#begin()
"   
"   " alternatively, pass a path where Vundle should install plugins
"   "call vundle#begin('~/some/path/here')
"   
"   " let Vundle manage Vundle, required
"   Plugin 'VundleVim/Vundle.vim'
"   Plugin 'Valloric/YouCompleteMe'
"   
"   " All of your Plugins must be added before the following line
"   call vundle#end()            " required
"   filetype plugin indent on    " required


" Vim Behavior Section  """""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Relative line numbering, except for absolute numbering on line holding cursor
set number
set relativenumber

" Highlight the current line and column
set cursorline
set cursorcolumn

" Show a guide line at column 81
set colorcolumn=81

" Show line, column, relative position in file in status line
set ruler

" Add some glyphs to demarcate notable invisible characters like EOL, etc.
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" General vim folding functionality - 'syntax' style may be preferrable to use on
" certain filetypes
set foldmethod=indent

" Set threshold on folding depth
" set foldnestmax=2

" Set buffers to not be folded, by default, when opening
set nofoldenable

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

" ,hc - 'High Contrast' - toggle contrast settings for some colorschemes
nnoremap <leader>hc :call ToggleColorSchemeContrast()<cr>

" toggle high contrast mode of Zenburn, noop for other color schemes
function! ToggleColorSchemeContrast()

    " Zenburn low->high
    if g:zenburn_high_Contrast && g:colors_name == "zenburn"
        let g:zenburn_high_Contrast = 0
        colorscheme zenburn
        hi ColorColumn ctermbg=lightgrey guibg=lightgrey
        redraw
        echo "zenburn low contrast enabled"

    " Zenburn high->low
    elseif !g:zenburn_high_Contrast && g:colors_name == "zenburn"
        let g:zenburn_high_Contrast = 1
        colorscheme zenburn
        hi ColorColumn ctermbg=lightgrey guibg=lightgrey
        redraw
        echo 'zenburn high contrast enabled'

    " Gruvbox hard->medium
    elseif g:gruvbox_contrast_dark == 'hard' && g:colors_name == "gruvbox"
        let g:gruvbox_contrast_dark = 'medium'
        colorscheme gruvbox
        hi ColorColumn ctermbg=lightgrey guibg=lightgrey
        redraw
        echo 'gruvbox medium contrast enabled'

    " Gruvbox medium->soft
    elseif g:gruvbox_contrast_dark == 'medium' && g:colors_name == "gruvbox"
        let g:gruvbox_contrast_dark = 'soft'
        colorscheme gruvbox
        hi ColorColumn ctermbg=lightgrey guibg=lightgrey
        redraw
        echo 'gruvbox soft contrast enabled'

    " Gruvbox soft->hard
    elseif g:gruvbox_contrast_dark == 'soft' && g:colors_name == "gruvbox"
        let g:gruvbox_contrast_dark = 'hard'
        colorscheme gruvbox
        hi ColorColumn ctermbg=lightgrey guibg=lightgrey
        redraw
        echo 'gruvbox hard contrast enabled'

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


" Gruvbox
let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_dark = 'medium'
" let g:gruvbox_contrast_dark = 'soft'
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
