" Set compatibility to Vim only
set nocompatible

" Automatically wrap text that beyong the screen length
set wrap

" Encoding
set encoding=utf-8

" Show line number 
set number
set relativenumber

" Set Tabspace
set tabstop=4

" Status bar 
set laststatus=2

" Disable Arrow keys in Normal mode
 map <up> <nop>
 map <down> <nop>
 map <left> <nop>
 map <right> <nop>

" map <up> :echoerr "Stop being stupid"<CR>
" " Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
syntax on
set noswapfile
set smartcase
set smartindent

" Callthe .vimrc.plug file 
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif
