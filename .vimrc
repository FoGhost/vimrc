filetype off
set nocompatible  " no vi compatibility.

" Plugins " {{{
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" " Programming
Bundle "jQuery"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-haml"
Bundle "kchmck/vim-coffee-script.git"
Bundle 'briancollins/vim-jst'

" " Snippets
Bundle "http://github.com/gmarik/snipmate.vim.git"

" " Instant-Markdown
Bundle "http://github.com/suan/vim-instant-markdown.git"

"
" " Syntax highlight
" Bundle "cucumber.zip"
" Bundle "Markdown"
"
" " Git integration
Bundle "fugitive.vim"
"
" " (HT|X)ml tool
" Bundle "ragtag.vim"

" " ColorSchema
Bundle "http://github.com/altercation/vim-colors-solarized.git"

" " Utility
" Bundle "git://git.wincent.com/command-t.git"
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "Align"

Bundle "Shougo/neocomplcache"
Bundle "Shougo/unite.vim"
Bundle "Shougo/vimshell"
let g:vimshell_editor_command='vim'
" Bundle "Shougo/vimfiler"

" Bundle "Shougo/vimproc"
" Bundle "fuenor/qfixhowm"
Bundle "fuenor/qfixgrep"

let qfixmemo_dir           = '~/.dropbox-two/Dropbox/howm'
let qfixmemo_filename      = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let qfixmemo_fileencoding  = 'utf-8'
let qfixmemo_fileformat    = 'unix'
let qfixmemo_filetype      = 'qfix_memo'

Bundle "http://github.com/scrooloose/nerdtree.git"
" " }}} Plugins

filetype plugin indent  on  " Automatically detect file types.

" Maplearder
:let mapleader = ","

" NeoComplcache " {{{

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
"
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Disable auto popup
" let g:neocomplcache_disable_auto_complete = 1

"  Print caching percent in statusline.
" let g:NeoComplCache_CachingPercentInStatusline = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'scala' : $DOTVIM.'/dict/scala.dict',
    \ 'ruby' : $DOTVIM.'/dict/ruby.dict'
    \ }

" snippet ファイルの保存先
let g:neocomplcache_snippets_dir='~/.vim/snippets'

" Define keyword.
if !exists('g:NeoComplCache_KeywordPatterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Popup on <Tab>.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}
" Auto complete to common string and show available variants (if any).
inoremap <expr><C-l> neocomplcache#complete_common_string()
" Highlighting first candidate.
let g:neocomplcache_enable_auto_select = 1
inoremap <expr><C-h> neocomplcache#smart_close_popup().“\<C-h>”
inoremap <expr><BS> neocomplcache#smart_close_popup().“\<C-h>”

" Choose candidate with <CR>.
inoremap <expr><CR> neocomplcache#smart_close_popup() . “\<CR>”

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
" let g:neocomplcache_enable_auto_select = 1
"
" Shell like behavior(not recommended).
" set completeopt+=longest
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_disable_auto_complete = 1
" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" " Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_force_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

inoremap pumvisible() ? neocomplcache#close_popup().“\X\” : “\X\”

" " }}} NeoComplcache

 " Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

 " alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Key map timeout
let timeoutlen             = 3000

" Change which file opens after executing :Rails command
let g:rails_default_file   = 'config/database.yml'

" NERDTree setting
let NERDTreeIgnore=['\.o$','\.bak$','\.pyc$'] " Hide .o，.bak file
let NERDTreeWinPos='left'

" Latex Suite settings
set grepprg=grep\ -nH\ $*
set shellslash
let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_dvi = 'platex -guess-input-enc -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'

syntax enable
syntax on
" :colorscheme evening
set background=dark
colorscheme solarized

set cf  " Enable error files & error jumping.
set clipboard=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set ambiwidth=double
set nocp incsearch
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set smartindent
set expandtab

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list

" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed
if has("mouse")
 set mouse=a  " Mouse in all modes
endif

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model() " Fabrication support

" Shortcuts

" " Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

map <right> :bn<cr>
map <left> :bp<cr>
map <space> :b#<cr>

" vim-rails autocommand
autocmd User Rails silent! Rnavcommand worker app/workers -glob=**/* -suffix=
