"语法高亮
syntax on
set nu 
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_ngdoc = 1
set foldmethod=syntax
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

"vim-js-indent
let js_indent_flat_switch = 1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_java_javac_custom_classpath_command = "ant -q path | grep echo | cut -f2- -d] | tr -d ' ' | tr ':' '\n'"
"let g:syntastic_java_javac_classpath = 'lib/*'

"autosave
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

"vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"nerdTree
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction
map <C-n> :NERDTreeToggle<CR>

"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"tagList
"let Tlist_Auto_Open=1
"set tags=tags
"set autochdir
let Tlist_Use_Right_Window = 1
map <C-i> :TlistToggle<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
map <F12> :!ant run<CR>

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" molokai
colorscheme molokai
set t_Co=256

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'pangloss/vim-javascript'
Plugin 'jason0x43/vim-js-indent'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
"lugin 'vim-scripts/Conque-Shell'
"Plugin 'vim-scripts/vim-auto-save'
Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'vim-scripts/Vim-JDE'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'othree/yajs.vim'

Plugin 'scrooloose/nerdcommenter'

"php
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"Plugin 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
"Plugin 'm2mdas/phpcomplete-extended'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
