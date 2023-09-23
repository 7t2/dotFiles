" Fix mouse in alacritty terminal
set ttymouse=sgr
set mouse=a

" Use system clipboard
set clipboard=unnamedplus

" Turn syntax highlighting on
syntax on

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Display line numbers on the left
set number
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Autoindent does nothing more than copy the indentation from the previous line, when starting a new line.
" It can be useful for structured text files, or when you want to control most of the indentation manually,
" without Vim interfering. 
set autoindent
