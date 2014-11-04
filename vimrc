" vimrc
"
" Copyright (c) 2006-2014  Connectical
"
" Authored by Óscar García Amor <ogarcia@connectical.com>
"
" Special thanks to (I stole them a lot of code)
" Adrián Pérez <aperez@connectical.com>
" Andrés J. Díaz <ajdiaz@connectical.com>
"
" Distributed under terms of the MIT license.
"

" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

let g:user  = "Óscar García Amor"
let g:email = "ogarcia@connectical.com"

if has("vim_starting")
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
filetype indent plugin on

" Plugin: CamelCaseMotion
" This plug-in has to be configured before sourcing
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" Plugin: NeoBundle
" This is the base bundle plugin and must be installed to work
if !isdirectory(expand('~/.vim/bundle/neobundle.vim'))
	if executable ('git')
		echo 'Installing NeoBundle ... '
		silent exe '!git clone https://github.com/Shougo/neobundle.vim'
			\ . ' ~/.vim/bundle/neobundle.vim'
	else
		echo 'Must install git before use this vimrc file'
		finish
	endif
endif

" Load plugins with NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'aperezdc/vim-template'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bkad/CamelCaseMotion',
	\ {'name' : 'vim-camelcasemotion'}
NeoBundle 'Shougo/unite.vim',
	\ {'name' : 'vim-unite'}
call neobundle#end()

" Plugin: Airline
let g:airline#extensions#tabline#enabled=1

set tabstop=2                 " Set tabstops to 2 spaces
set smarttab                  " Use smart tabs... we are not as dumb!
set shiftwidth=2              " Set indentation shift-width to 2 spaces
set autoindent                " Enable automatic indentation
set copyindent                " Enable automatic indentation of pasted lines
set incsearch                 " Use incremental search
set smartcase                 " No case-sense by default, but on on typing mays.
set nohlsearch                " Disable search highlighting
set ruler                     " Show line number & column
set laststatus=2              " Always show a status line
set sidescrolloff=2           " Keep some context when scrolling
set scrolloff=6               " The same in vertical :)
set viminfo+=n~/.viminfo      " Name of the viminfo file
set whichwrap+=[,],<,>        " Allow arrow keys to wrap lines
set nowrap                    " Don't wrap long lines
set showmode                  " Print the current mode in the last line
set ttyfast                   " Lots of console stuff that may slow down Vim
set showfulltag               " Do not show full prototype of tags on completion
set showcmd                   " Show commands as they are typed
set formatoptions+=cqron1     " Some useful formatting options
set showmatch                 " Show matching parens
set textwidth=76              " Text is 76 columns wide
set backspace=2               " Backspace always useable in insert mode
set fileformats=unix,mac,dos  " Allows automatic line-end detection.
set completeopt-=preview
set ignorecase
set infercase
set splitbelow
set splitright
set hidden
set diffopt+=iwhite
set nobackup
set tags=tags;/
set nofsync
set nosol
set shortmess+=a
set noshowmode
set grepprg=ag\ --noheading\ --nocolor\ --nobreak
set secure
set undofile                  " Save undo's after file closes
set undodir=$HOME/.vim/undo   " where to save undo histories
set undolevels=1000           " How many undos
set undoreload=10000          " number of lines to save for undo

" Load a .vimrc from any directory (commented by default)
"set exrc

if has("mouse")
	if has("mouse_sgr")
		set ttymouse=sgr
	endif
endif

if has("linebreak")
	set linebreak          " Break on `breakat' chars when linewrapping is on.
	set showbreak=+        " Prepend `+' to wrapped lines
endif

if has("folding")
	set foldminlines=5     " Don't fold stuff with less lines
	set foldmethod=syntax  " Use syntax-aware folding
	set nofoldenable       " Don't enable folding by default
	map , zj
	map - za
	map _ zA
endif

if has("wildmenu")
	set wildmenu           " Show completions on menu over cmdline
	set wildchar=<TAB>     " Navigate wildmenu with tabs
	set wildignore=*.o,*.cm[ioax],*.ppu,*.core,*~,core,#*#
endif

if has("autocmd")
	" Tune defaults for some particular file types.
	autocmd FileType javascript setlocal expandtab
	autocmd FileType *html,xml setlocal matchpairs+=<:>
	autocmd FileType xhtml,xml let xml_use_xhtml=1
	autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
	autocmd FileType lua setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType rst setlocal expandtab tabstop=2 shiftwidth=2
	autocmd FileType objc setlocal expandtab cinoptions+=(0
	autocmd FileType cpp setlocal expandtab cinoptions+=(0
	autocmd FileType c setlocal expandtab cinoptions+=(0
	autocmd FileType d setlocal expandtab cinoptions+=(0

	" Jump to the last edited position in the file being loaded (if available)
	" in the ~/.viminfo file, I really love this =)
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\		execute "normal g'\"" |
				\ endif

	" Set PO mode for POT gettext templates, too.
	autocmd BufEnter *.pot
				\ setf po | setlocal fenc=utf8

	" Set Python mode for Twisted Application Configuration (.tac) fiels.
	autocmd BufReadPost,BufNewFile *.tac setf python

	" Add the `a' format option (autoreflow) to plain text files.
	autocmd BufReadPost,BufNewFile *.txt,*README*,*TODO*,*HACKING*,*[Rr]eadme*,*[Tt]odo*
				\ setlocal expandtab

	" System headers usually are designed to be viewed with 8-space tabs
	autocmd BufReadPost /usr/include/* setlocal ts=8 sw=8

	" Tup build system
	autocmd BufNewFile,BufRead Tupfile,*.tup setf tup

	" Use Enter key to navigate help links.
	autocmd FileType help nmap <buffer> <Return> <C-]>
endif

" When under xterm and compatible terminals, use titles if available and
" change cursor color depending on active mode.
if &term =~ "xterm" || &term =~ "screen" || &term =~ "tmux"
	if has("title")
		set title
	endif
endif

" Some fixups for Screen, which has those messed up in most versions
if &term =~ "screen"
	map  <silent> [1;5D <C-Left>
	map  <silent> [1;5C <C-Right>
	lmap <silent> [1;5D <C-Left>
	lmap <silent> [1;5C <C-Right>
	imap <silent> [1;5D <C-Left>
	imap <silent> [1;5C <C-Right>
endif

if has("syntax") || has("gui_running")
	syntax on
	if has("gui_running")
		colorscheme twilight
		set guifont=PragmataPro\ 12
		set guifontwide=VL\ Gothic
	else
		if &term =~ "-256color" || $COLORTERM =~ "gnome-terminal"
			set t_Co=256
		endif
		colorscheme elflord
	endif
	" Match whitespace at end of lines (which is usually a mistake),
	" but only while not in insert mode, to avoid matches popping in
	" and out while typing.
	highlight WhitespaceEOL ctermbg=red guibg=red
	if has("autocmd")
		augroup WhitespaceEOL
			autocmd!
			autocmd InsertEnter * syn clear WhitespaceEOL | syn match WhitespaceEOL excludenl /\s\+\%#\@!$/
			autocmd InsertLeave * syn clear WhitespaceEOL | syn match WhitespaceEOL excludenl /\s\+$/
		augroup END
	else
		match WhitespaceEOL /\s\+$/
	endif
	" Remove background color to SignColumn used by gitgutter
	highlight clear SignColumn
endif

" Let Vim be picky about syntax, so we are reported of glitches visually.
let c_gnu                = 1
let use_fvwm_2           = 1
let c_space_errors       = 1
let java_space_errors    = 1
let ora_space_errors     = 1
let plsql_space_errors   = 1
let python_space_errors  = 1
let python_highlight_all = 1
let g:sql_type_default   = 'mysql'

" Set up things for UTF-8 text editing by default, if multibyte
" support was compiled in. Let Linux consoles be Latin-1.
if has("multi_byte")
	set encoding=utf-8
	if $TERM == "linux" || $TERM_PROGRAM == "GLterm"
		set termencoding=latin1
	endif
endif

" Autocorrect some usually-mispelled commands
command! -nargs=0 -bang Q q<bang>
command! -bang W write<bang>
command! -nargs=0 -bang Wq wq<bang>

" Saves current position, executes the given expression using :execute
" and sets the cursor in the saved position, so the user thinks cursor
" was not moved at all during an operation.
function ExecuteInPlace(expr)
	let l:linePos = line(".")
	let l:colPos = col(".")
	execute a:expr
	call cursor(l:linePos, l:colPos)
endfunction

" Checks wether a given path is readable and sources it as a Vim script.
" Very useful to load scripts only when available.
function <SID>SourceIfAvailable(path)
	if filereadable(expand(a:path))
		execute "source " . expand(a:path)
	endif
endfunction

" Some commands used to thrash trailing garbage in lines.
command -nargs=0 KillEolLF      call ExecuteInPlace("%s/\\r$//")
command -nargs=0 KillEolSpaces  call ExecuteInPlace("%s/[ \\t]\\+$//")
command -nargs=0 KillEolGarbage call ExecuteInPlace("%s/[ \\t\\r]\\+$//")
command -nargs=0 EolMac2Unix    call ExecuteInPlace("%s/\\r/\\n/g")
command -nargs=0 EolUnix2Mac    call ExecuteInPlace("%s/$/\\r/g")
command -nargs=0 EolUnix2DOS    call ExecuteInPlace("%s/$/\\r\\n/g")

" Simple autocompletion with <TAB>, uses Omni Completion if available.
function! s:completion_check_bs()
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
			\ <SID>completion_check_bs() ? "\<TAB>" :
			\ &omnifunc == "" ? "\<C-p>" :"\<C-x><C-o><C-p>"

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move to the previous/mext buffer
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>

" Exit swiftly
map __ ZZ

" Start searching with spacebar.
map <Space> /

" F2 -> Save file
map  <F2>   :w!<CR>
imap <F2>   <ESC>:w!<CR>a

" F3 -> Toggle line numbers
map  <F3>   :set nu!<CR>
imap <F3>   <ESC>:set nu!<CR>i

" F4 -> Open unite with file and buffer
function <SID>OpenUniteFileBuffer()
	if (bufname("%") != "[unite] - default")
		Unite file buffer
	endif
endfunction
map  <F4>   :call <SID>OpenUniteFileBuffer()<CR>
imap <F4>   <ESC>:call <SID>OpenUniteFileBuffer()<CR>

" F5 -> Compile/build
" F6 -> Show build errors
" F7 -> Previous error
" F8 -> Next error
map  <F5>   :wall!<CR>:make<CR>
map  <F6>   :cl!<CR>
map  <F7>   :cp!<CR>
map  <F8>   :cn!<CR>

" F12 -> Save all and exit
map  <F12>  :xa!<CR>
map! <F12>  <ESC>:xa!<CR>

NeoBundleCheck

" vim:ts=4:sw=4:fenc=utf-8
