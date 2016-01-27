" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

autocmd FileType c,cpp set ts=4 | set expandtab
set nu!
set background=dark

function! TitleInsertCpp()
	call setline(1, '/****************************************************')
	call append(1, '	coding: utf-8')
        call append(2, '	Author: jluchuang')
        call append(3, '	File Name: '.expand("%"))	
        call append(4, '	Email: jlu_chuang@163.com')
        call append(5, '	Last modified: '.strftime("%Y-%m-%d %H:%M"))
	call append(6, '*****************************************************/')
endf

function! TitleInsertJava()
	call setline(1, '/****************************************************')
        call append(1, '        coding: utf-8')
        call append(2, '        Author: jluchuang')
        call append(3, '        File Name: '.expand("%"))
        call append(4, '        Email: jlu_chuang@163.com')
        call append(5, '        Last modified: '.strftime("%Y-%m-%d %H:%M"))
        call append(6, '*****************************************************/')
endf


function! TitleInsertPython()
        call setline(1, '#*****************************************************')
        call append(1, '#        coding: utf-8')
        call append(2, '#        Author: jluchuang')
        call append(3, '#        File Name: '.expand("%"))
        call append(4, '#        Email: jlu_chuang@163.com')
        call append(5, '#        Last modified: '.strftime("%Y-%m-%d %H:%M"))
        call append(6, '#*****************************************************')
endf

func SetComment()
	if(expand("%:e") == 'cpp')
		call TitleInsertCpp()
        endif
        if(expand("%:e") == 'java')
		call TitleInsertJava()
        endif
	if(expand("%:e") == 'py')
      		call TitleInsertPython()
	endif
endfunc
"SET Comment START
autocmd BufNewFile *.cpp exec ":call SetComment()" | normal 10Go
autocmd BufNewFile *.java exec ":call SetComment()" | normal 10Go
autocmd BufNewFile *.py exec ":call SetComment()" | normal 10Go

