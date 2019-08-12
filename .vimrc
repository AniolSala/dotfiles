" List
call plug#begin('~/.vim/plugged')
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Indent line
Plug 'Yggdroot/indentLine'
" Syntax highlighting
Plug 'w0rp/ale'
" UI related
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'Townk/vim-autoclose'
" Show func signature
Plug 'davidhalter/jedi'
Plug 'Valloric/YouCompleteMe'
" Improve syntax hightlighting
Plug 'justinmk/vim-syntax-extra'
" Icons
Plug 'ryanoasis/vim-devicons'
" Colorschemes
Plug 'sainnhe/vim-color-forest-night'
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
" Better Visual Guide
Plug 'Yggdroot/indentLine'
" For python
Plug 'davidhalter/jedi-vim'
" Formater
Plug 'Chiel92/vim-autoformat'
call plug#end()


set guifont=Ubuntu\ Mono\ Regular\ 12

" FUNCTIONS

" Shortcut for C-A
function CA()
    let extension = expand('%:e')
    if extension == 'c' || extension == 'cpp'
        execute "normal! A;"
        startinsert!
    elseif extension == 'py'
        execute "normal! A:\<CR>"
        startinsert!
    endif
endfunction

" For executing documents
function RunFile()
    let extension = expand('%:e')
    let filename = expand('%:t:r')
    let root = expand('%')
    if extension == 'c'
        execute "normal! :!gcc ./".root." -o ".filename." && ./".filename."\<CR>"
    elseif extension == 'py'
        execute "normal! :!python3 ./".root."\<CR>"
    endif
endfunction

" For comments in C:
function InsertComment()
    let extension = expand('%:e')
    if extension == 'c'
        execute "normal! o/*  */\<esc>hh"
    endif
    startinsert
endfunction

function MakeLineComment()
    let extension = expand('%:e')
    if extension == 'c'
        execute "normal! I/* \<esc>$a */\<esc>I\<esc>"
    endif
endfunction

function ToggleBlockCode()
    let extension = expand('%:e')
    if extension == 'c'
        visual
        execute "normal! c*/\<esc>PO/*"
        visual-end
    endif
endfunction

" Function to write header of C and Python files
function GetStarted()
    let extension = expand('%:e')
    " echom extension
    if extension == 'c'
        echom "This is a C file"
        execute "normal! i#include <stdio.h>\<CR>#include <stdlib.h>\<CR>#include <string.h>\<CR>\<CR>\<CR>int main()\<CR>{\<CR>}\<esc>Oreturn 0;\<esc>ka\<CR>"
        execute "normal! i\<tab>"
        startinsert!
    elseif extension == 'py'
        echom "This is a python file"
        execute "normal! iif __name__ == '__main__':\<CR>main()"
        execute "normal! kOdef main():\<CR>pass\<CR>\<CR>\<esc>kkcc"
        execute "normal! i\<tab>"
        startinsert!
    endif
endfunction

function MoveTab()
    let char = getline('.')[col('.')]
    let cursor = getpos('.')[2] - 1

    if char == ')'
        execute 'normal! l'
    elseif char == '}'
        execute 'normal! l'
    elseif char == '"'
        execute 'normal! l'
    elseif char == ']'
        execute 'normal! l'
    elseif char == "'"
        execute 'normal! l'
    elseif cursor == 0
        execute "normal! i\<tab>"
    else
        execute "normal! a\<tab>"
    endif
endfunction

filetype plugin indent on
scriptencoding utf-16      " allow emojis in vimrc

" enable syntax highlighting
syntax on
syntax enable
"
" " show line numbers
set number
"
"" set tabs to have 4 spaces
set ts=4
filetype plugin indent on
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Other config for tab
set softtabstop=4
set smarttab

" when using the >> or << commands, shift lines by 4 spaces
" set shiftwidth=4
"
"" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

"" enable all Python s" yntax highlighting features
let python_highlight_all = 1
"
" colorscheme         "
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark

let g:one_allow_italics = 1
" let g:onedark_terminal_italics = 1
" colorscheme base16-onedark
colorscheme one
let g:airline_theme='onehalfdark'


" relative linenunbers
:set relativenumber


"_____________
"             |
" KEYBINDINGS |
"_____________|

let mapleader = ','

" Put a selected part between parenghesis
vmap <leader>( s(<esc>pa)<esc>
vmap <leader>[ s[<esc>pa]<esc>
vmap <leader>" s"<esc>pa"<esc>
vmap <leader>' s'<esc>pa'<esc>
vmap <leader>{ s{<esc>pa}<esc>
vmap <leader>< s<<esc>pa><esc>
vmap <leader>` s`<esc>pa`<esc>

nmap <leader>( viws(<esc>pa)<esc>
nmap <leader>[ viws[<esc>pa]<esc>
nmap <leader>" viws"<esc>pa"<esc>
nmap <leader>' viws'<esc>pa'<esc>
nmap <leader>{ viws{<esc>pa}<esc>
nmap <leader>< viws<<esc>pa><esc>
nmap <leader>` viws`<esc>pa`<esc>

" split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" buffer navigation
nmap <C-p> :bnext<CR>
nmap <C-o> :bprevious<CR>
nmap <leader><C-p> :blast<CR>
nmap <leader><C-o> :bfirst<CR>

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>

" For C programming
nnoremap <leader><C-s> :call GetStarted()<CR>
nnoremap ; ct;
nnoremap _ ct_
imap <C-a> <esc><esc>:call CA()<CR>
imap <C-z> <esc><esc>A {<CR>

nmap <C-q> :call InsertComment()<CR>
nmap <leader><C-q> :call MakeLineComment()<CR>
vmap <C-q> :call ToggleBlockCode()<CR>

" Copy and paste to clipboard
" copy
vmap <C-c> "+y
" cut
vmap <C-x> "+d
" paste in insert mode
imap <C-v> <Esc>"+pa

" fast scrolling
nmap <C-k> 10k
nmap <C-l> 3e
nmap <C-j> 10j
nmap <C-h> 3b

" Run python code:
nnoremap <F9> :w<CR>:call RunFile()<CR>

" Save the file with ctrl-s
:nmap <c-s> :Autoformat<CR>:w<CR>
:imap <c-s> <Esc>:Autoformat<CR>:w<CR>

" Escape terminal mode with esc and allow split navigation
:tmap <Esc> <C-\><C-n>

" Tab move forward in normal mode
" imap <tab> <esc>:call MoveTab()<CR>a

imap <C-e> <C-o>A

nmap <leader><C-e> 20<C-e>
nmap <leader><C-y> 20<C-y>


" Cursor settings
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
    let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[3 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    " autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[1 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)]"]"]"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endif
" Shape of the cursor
set guicursor=i:ver25-blinkon2

" Split below and split right by default
:set splitright
:set splitbelow


""""""""""""""""""""""""""""
"""Airline configuration"""
""""""""""""""""""""""""""""
" Unicode symbols:
" https://www.vertex42.com/ExcelTips/unicode-symbols.html
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '☰'

" powerline symbol
let g:airline_left_sep = '▞▗'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty= "⚡"

" Symbols for the tabline (upper line) only
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'c'  : 'C',
            \ 'i'  : 'I',
            \ 'ic' : 'I',
            \ 'ix' : 'I',
            \ 'n'  : 'N',
            \ 'ni' : 'N',
            \ 'no' : 'N',
            \ 'R'  : 'R',
            \ 'Rv' : 'R',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ 't'  : 'T',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ }

let g:lightline = {
            \ 'colorscheme': 'one',
            \ }


" Ale highlighting
let g:ale_enabled = 1
let g:ale_set_balloons = 1
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_linters_ignore = {'python': ['pylint']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = ' ⦁'
let g:ale_sign_warning = ' ⦁'
let g:ale_sign_info = ' ⦁'
let g:ale_sign_style_error = ' ⦁'
let g:ale_sign_style_warning = ' ⦁'
set signcolumn=yes

highlight ALEError ctermbg=DarkMagenta cterm=underline
highlight ALEWarning ctermbg=DarkMagenta cterm=underline

" jedi
" let g:jedi#auto_initialization=0
let g:jedi#popup_on_dot=0
let g:pymode_rope=0

" Display errors autoformatter
" let g:autoformat_verbosemode=1
let g:formatter_yapf_style = 'pep8'

" Line highlight
:hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Transparent background
" hi Normal guibg=NONE ctermbg=NONE

" YCM Configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_auto_trigger=1
let g:ycm_semantic_triggers = {
            \   'c': [ 're!\w{2}' ],
            \   'cpp': [ 're!\w{2}' ],
            \   'python': [ 're!\w{2}' ]
            \ }
let g:ycm_key_list_select_completion = ['<Down>']

" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1 " Remove buffer when enter in command mode
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_show_diagnostics_ui = 0

" Indent line
let g:indentLine_char = '┊'
