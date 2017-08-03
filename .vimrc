syntax enable
filetype indent on

" set number
set nu
" set autoindent
set ai
set cursorline
set mouse=a
set ruler
set bg=dark
set showmode
" set hlsearch
set hls
set incsearch
" set expandtab
set laststatus=2
set encoding=utf-8
set tabstop=4

" inoremap ( ()<Esc>i
" inoremap " ""Esc>i
" inoremap ' ''<Esc>i
" inoremap [ []<Esc>i
" inoremap (<CR> {<CR>}<Esc>ko

" highlight
" highlight Search term=reverse ctermbg=4 ctermfg=7
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE


if has("autocmd")
        autocmd BufRead *.txt set tw=78
        autocmd BufReadPost *
                                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                                \   exe "normal g'\"" |
                                \ endif
endif

set statusline=[%{expand('%:p')}][%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%{FileSize()}%{IsBinary()}%=%c,%l/%L\ [%3p%%]

function IsBinary()
        if (&binary == 0)
                return ""
        else
                return "[Binary]"
        endif
endfunction

function FileSize()
        let bytes = getfsize(expand("%:p"))
        if bytes <= 0
                return "[Empty]"
        endif
        if bytes < 1024
                return "[" . bytes . "B]"
        elseif bytes < 1048576
                return "[" . (bytes / 1024) . "KB]"
        else
                return "[" . (bytes / 1048576) . "MB]"
        endif
endfunction

