" Preamble -------------------------------------------------{{{1
" Joseph Knight
" JosephKnight@JosephKnight.com
" Created 2018-Nov
" TODO ------------------------------------------------------------
" Install plugins or enable vim features for the following:
" project mgmt
" refactoring
" debugging
" static syntax analysis
" consistently overriding cursor color regardless of theme
" turn off auto wrap when typing. formatopetions below not working!
"
" ============================================================================

" Plugin ---------------------------------------------------{{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC  " Use :PlugInstall to init.
endif

call plug#begin('~/.vim/bundle')
" Plug 'notpratheek/vim-luna' " Luna colorscheme
" Plug 'ajmwagar/vim-deus'  " A lot of work went into it, but the bg is too light. delete once theme is set, keep around for vim scripting ideas.

Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ctrlp.vim'
Plug 'vim-scripts/tComment'  " This or commentary, but not both.
" Plug 'davidhalter/jedi-vim'  " This or supertab, but not both.
Plug 'sickill/vim-pasta'  " Pasting in Vim with indentation adjusted to destination context.
Plug 'vim-syntastic/syntastic'  " external syntax checking plugin.
Plug 'vim-scripts/ZoomWin'  " Use ctrl-w,o to zoom in/out of a split window.
Plug 'terryma/vim-smooth-scroll'
Plug 'mhinz/vim-startify'  "Fancy Startup Screen
" " Using someone's forked fix here due to errors with official python-mode.
" Check often for PR acceptance or issue-resolving updates to official.
" Plug 'riher/python-mode', { 'branch': 'fix/py3-importlib' }
" Plug 'python-mode/python-mode' ", { 'branch': 'develop' }
Plug 'gko/vim-coloresque'  " Colorize background of color strings in code.
" Plug 'hdima/python-syntax'  " trying to get variables and other elements to colorize!
call plug#end()

" General ------------------------------------------------------------------{{{1
set term=xterm-256color
set t_Co=256
set nocompatible
set path+=** " This sometimes causes freezing with find. Unfreeze with ctrl-c.
syntax enable
filetype plugin on
set autoread  " Auto load external file changes. Changes still undoable.
set cursorline
set backspace=indent,eol,start
set list
set listchars=tab:▸\ ,precedes:«,extends:»

" remap colon/semi-colon
nnoremap : ;
nnoremap ; :

" Rebind <Leader> key
let mapleader=","
let maplocalleader="\\"

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
    " Execute current selection/line
vnoremap <Leader>E y:execute @@<cr>
nnoremap <Leader>E ^vg_y:execute @@<cr>

noremap <Leader>r :set relativenumber!<cr>

" Display info on element under cursor (useful for syntax schemeing).
noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" general
" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
"" set pastetoggle=<F2>
"" set clipboard=unnamed

" Quicksave command
"" noremap <C-Z> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>

map <c-h> 0
" map <c-j> 
" map <c-k> 
map <c-l> $

" Window focus movement
map <Leader>h <c-w>h
map <Leader>l <c-w>l
map <Leader>j <c-w>j
map <Leader>k <c-w>k

" vim-smooth-scroll  (distance, millis/frame, lines/frame)
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll,5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>

" Easier moving between tabs
"map <Leader>n <esc>:tabprevious<CR>
"map <Leader>m <esc>:tabnext<CR>

" Map sort function
vnoremap <Leader>s :sort<CR>

" Move blocks
vnoremap < <gv
vnoremap > >gv

" Color scheme
colorscheme jk_colorscheme
highlight ExtraWhitespace ctermbg=black
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight line 81 wherever it contains a character.  highlight margincolor ctermbg=53
highlight  margincolor ctermbg=53
call matchadd('margincolor', '\%81v', 100)

" Showing line numbers and length
set number  " show line numbers
set relativenumber
set textwidth=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set formatoptions-=t   " don't automatically wrap text when typing

" easier formatting of paragraphs
" vmap Q gq
" nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Tabs & Spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
noremap <C-_> :noh<CR> " vim sees <C-/> as <C-_>. / is find and ctrl-/ is clear hlt.

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile

" Airline --------------------------------------------------------{{{1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jk_airline' " TODO: try moving contents to main theme file.

" netrw -----------------------------------------------------------{{{1
let g:netrw_liststyle = 3
" let g:netrw_winsize = 20 "% of the screen section whether vertically or horizontally depending on Vex/Sex used.

" Python IDE ------------------------------------------------------{{{1

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildmenu
set wildignore+=*.pyc,*.gh,*.git,*.svn,*.aux,*.out,*.toc,.DS_Store
set wildignore+=*.jpg,*.bmp,*.giv,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll
set wildignore+=*_build/*,*/coverage/*

" Vim Temp folders -----------------------------------------------{{{1
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

" Settings for python-mode ---------------------------------------{{{1
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
let g:pymode_python = 'python3'
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_builtin_funcs = 1
let g:pymode_options_max_line_length = 80
let g:pymode_options_colorcolumn = 0

let g:pymode_lint_ignore = ["E272", "E501", "E701"] 

"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable

" jedi-vim -------------------------------------------------------{{{1
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0

" OmniComplete? ---------------------------------------------------{{{1
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

