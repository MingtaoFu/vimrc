" 输入开括号时不展开折叠
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set encoding=utf-8
set expandtab
set backspace=2

" 不换行
set nowrap

" 语法高亮
syntax on
set nu 

let NERDTreeIgnore = ['\.pyc$']

" Enable folding
set foldmethod=indent
set foldlevel=99

"vim-js-indent
let js_indent_flat_switch = 1


"syntastic
"let g:syntastic_disabled_filetypes=['html']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_javascript_checkers = ['eslint']

"let g:syntastic_c_compiler = 'gcc'
"let g:syntastic_c_config_file = '.syntastic_c_config'
"let g:syntastic_c_no_include_search = 1
"let g:syntastic_c_compiler_options = '-std=gnu11'

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_java_javac_custom_classpath_command = 'ant -q path | grep echo | cut -f2- -d] | tr -d \' \' | tr \':\' '\n''
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
let g:ycm_global_ycm_extra_conf = '/home/mingtao/.vim/bundle/YouCompleteMe/ycm/.ycm_extra_conf.py'
" let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_python_binary_path = 'python'

"tagList
"let Tlist_Auto_Open=1
"set tags=tags
"set autochdir
let Tlist_Use_Right_Window = 1
map <C-i> :TlistToggle<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
map <S-F9> :! sh ./run.sh<CR>

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" set the runtime path to include Vundle and initialize
set rtp+=/home/mingtao/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" cursor
"set cursorcolumn
set cursorline

" molokai
"colorscheme molokai
"
Plugin 'morhetz/gruvbox'
"let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
set t_Co=256
"Plugin 'SpaceVim/SpaceVim-theme'
"colorscheme SpaceVim

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'tomasr/molokai'
"Plugin 'pangloss/vim-javascript'
Plugin 'jason0x43/vim-js-indent'
Plugin 'elzr/vim-json'
"Plugin 'heavenshell/vim-jsdoc'
"Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'maksimr/vim-jsbeautify'
"lugin 'vim-scripts/Conque-Shell'
"Plugin 'vim-scripts/vim-auto-save'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'vim-scripts/Vim-JDE'
"Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/git-nerdtree'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
"let g:NERDTreeUseSimpleIndicator = 1
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'othree/yajs.vim'

"Plugin 'Shougo/deoplete.nvim'

"Plugin 'roxma/nvim-yarp'
"Plugin 'roxma/vim-hug-neovim-rpc'
"let g:deoplete#enable_at_startup = 1
"Plugin 'davidhalter/jedi-vim'

Plugin 'tmhedberg/SimpylFold'

"md
"Plugin 'shime/vim-livedown'

"latex
"Plugin 'xuhdev/vim-latex-live-preview'
"let g:livepreview_previewer = 'foxitreader'

"php
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"Plugin 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'StanAngeloff/php.vim'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'm2mdas/phpcomplete-extended'

"autocmd VimEnter * SyntasticToggleMode " disable syntastic by default

"json
set conceallevel=3
let g:vim_json_syntax_conceal = 0

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'

Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
"let mapleader=";"
"filetype plugin on

" 这些内容必须放在某个东西的下面，以前放在上面，失效了
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme="luna" 
let g:airline_powerline_fonts = 1
set laststatus=2



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
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()

"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
