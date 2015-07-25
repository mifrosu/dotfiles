set nocompatible		" be iMproved, required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ

" Plugins non-colorschemes
Plugin 'airblade/vim-gitgutter'
"Plugin 'kien/ctrlp.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/a.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Plugins/colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'

" All of your Plugins must be added before the following line
call vundle#end()		" required
syntax enable
filetype plugin indent on	" required

" NERDTree
map <F8> :NERDTreeToggle<CR>

au BufNewFile,BufRead *.coffee set filetype=coffee

"colorscheme Tomorrow-Night-Bright

set nobackup
set history=50
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler         " show cursor position at all times
set showcmd       " show incomplete commands
set incsearch     " do incremental searching
set expandtab
set shiftwidth=2
set softtabstop=2
"set relativenumber
"set cursorline
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set lazyredraw
set ttyfast

" treat *.md as markdown rather than modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:jsx_ext_required = 0

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  set cinoptions=g0

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"--------------------------
"MOS additions
"--------------------------

set timeoutlen=2000  " sets command timeout to 2000 msec

" Enable 256 colours in vim
set t_Co=256

set noeb vb t_vb=		" Suppress error bells

".....................
" Key mapping
:map <F2> :echo 'Current time: ' . strftime('%c')<CR>
:map! <F3> <C-R>=strftime('%c')<CR><Esc>

" Add the following lines to your .vimrc file for spell checking
set spell
set spell spelllang=en_gb
set spellfile=~/.vim/spellfile.add
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1
highlight SpellBad term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
map <F6> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F7> <Esc>:setlocal nospell<CR>
" F6 and F7 toggle spelling on and off respectively.
" ]s [s to move between mispelled words
" cursor on mispelled word,  z=  shows suggestions
" zg   add word to dictionary
" zug  undo dictionary addition
"

"" spaces for tabs (2 for ruby) 
set tabstop=2
set shiftwidth=2
set expandtab

""" set default syntax colours for a dark background
set background=dark
"highlight Comment ctermfg=Cyan
highlight PreProc cterm=bold ctermfg=Blue
highlight Type cterm=bold ctermfg=Green
highlight Special cterm=bold ctermfg=Yellow
highlight Statement term=bold cterm=bold ctermfg=11 gui=bold guifg=#ffff60
highlight Constant term=bold cterm=bold ctermfg=13 gui=bold guifg=#ffa0a0

hi Visual term=none cterm=none ctermbg=White ctermfg=Black  guibg=Grey
"hi Visual term=reverse cterm=reverse guibg=Grey
highlight Pmenu ctermfg=255 ctermbg=Magenta guibg=grey50
highlight PmenuSel cterm=reverse ctermbg=0 ctermfg=255 guibg=Black
"highlight folded ctermbg=235 
"highlight FoldColumn ctermbg=0 
"highlight TagListFileName ctermbg=255 ctermfg=0
"highlight TagListFileName ctermbg=235
"highlight StatusLine term=bold,reverse cterm=bold,reverse gui=bold,reverse
"

" Mini Buffer settings."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" tagbar keybinding
runtime macros/matchit.vim
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_singleclick = 1   " single click to jump to tag 
let g:tagbar_autoshowtag = 1   " tag will be unfolded to show current tag

" NERDTree keybinding 
nnoremap <silent> <F8> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1

" delimitMate
" CR expansion within braces enabled
let delimitMate_expand_cr = 1

" enable C++11 syntax highlighting
au BufNewFile,BufRead *.cpp set syntax=cpp11

" enable Javascript syntax formatting for QML
au BufNewFile,BufRead *.qml setf javascript 

"---------------------------------------
" Dispatch
"---------------------------------------
:nnoremap <F10> :Dispatch<CR>

"---------------------------------------
" Custom Leaders
"---------------------------------------

:nnoremap <leader>r :!ruby %<cr>

" Open files
"---------------------------------------
map <leader>cs :sp /d/documents/vim_cheatsheet.txt<CR>

" Vertically centre cursor (toggle)
"---------------------------------------
map <leader>zz :let &scrolloff=999-&scrolloff<CR>
" scrolloff value is 999-0 = 999 if scrolloff was 0
" scrolloff value is 999-999 = 0 if scrolloff was 999
