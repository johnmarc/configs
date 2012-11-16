"display line numbers
set number

"set autoindent
set ai

"etsy style tabs (aka no tabs, 4 spaces, some people use 2 here for ruby)
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

"histoy 500 (some prefer 1000 or more)
set history=500

"case insensitve search by default
set ignorecase

"vi is dead as dead
set nocompatible

"dannel's ruler
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

"blinking is better than beeping when you listen to tunes all day
set visualbell

"syntax highlighting
syntax on

"if you're in a screen, set the title to the file name, and stuff... (forget what)
let &titlestring = expand("%:t")
if &term == "screen"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

"Allow F4 to toggle the Tag list (use tagsup to generate)
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

"hilight end of line whitespace in yellow when not in insert mode
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

"remove trailing whitespace on save
autocmd BufWritePre *.php :%s/\s\+$//e

let Vimphpcs_Standard='/home/jimbrescia/development/Web/tests/standards/staging-ruleset.xml'
autocmd BufWritePre *.php :%s/if(/if (/e
autocmd BufWritePre *.php :%s/foreach(/foreach (/e
"autocmd BufWritePost *.php silent! :CodeSniff
"vim-clipboard stuff
com -range Cz :silent :<line1>,<line2>w !xsel -i -b
com -range Cx :silent :<line1>,<line2>w !xsel -i -p
com -range Cv :silent :<line1>,<line2>w !xsel -i -s
ca cv Cv
ca cz Cz
ca cx Cx

com -range Pz :silent :r !xsel -o -b
com -range Px :silent :r !xsel -o -p
com -range Pv :silent :r !xsel -o -s

ca pz Pz
ca px Px
ca pv Pv

set clipboard=unnamed
set hidden
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

let g:ctrlp_match_window_bottom = 0
 let g:ctrlp_max_height = 20

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%120v.*/

map <Leader>b :CtrlPBuffer<CR>
map <leader>r :CtrlPMRU<CR>

let g:ctrlp_mruf_max = 500
let g:ctrlp_mruf_relative = 1
call pathogen#infect()

"Make mouse work 
if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    " for some reason, doing this directly with 'set ttymouse=xterm2'
    " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
    " makes tmux enter copy mode instead of selecting or scrolling
    " inside Vim -- but luckily, setting it up from within autocmds
    " works                   
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

set undofile
set undodir=~/.vim/undo
