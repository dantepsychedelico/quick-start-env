" -- change backgroup color, eg. vim syntac error, edit no save...
" Vundle setting start
set nocompatible " NOTE: Filetypes and 'compatible' don't work together well, since being Vi compatible means options are global.  Resetting 'compatible' is recommended, if you didn't do that already.
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my plugin
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'taglist', {'pinned': 1}			" local dir
Plugin 'moll/vim-node'					" nodejs plugin(unread)
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'		" quick move cursor(unread)
Plugin 'tpope/vim-fugitive'    			"git tool
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'			" javascript beautify
Plugin 'scrooloose/syntastic'			" npm install -g jshint
" Plugin 'mileszs/ack.vim'              " quick ack(unread)
Plugin 'tpope/vim-surround'    			" quick edit html file
Plugin 'Yggdroot/indentLine'    		" indent vertical line
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'marijnh/tern_for_vim'			" javascript autocomplete; cd ~/.vim/bundle/tern_for_vim && npm install
Plugin 'othree/yajs.vim'				" javascript es6
" Plugin 'othree/javascript-libraries-syntax.vim' " js lib syntax
Plugin 'mxw/vim-jsx'					" jsx
Plugin 'leafgarland/typescript-vim'     " vim ts
Plugin 'Rykka/riv.vim'					" rst(sphinx)
Plugin 'Rykka/InstantRst'				" rst(sphinx)
" Plugin 'Valloric/YouCompleteMe'		" c, c++, object C
Plugin 'othree/html5.vim'				" html5 syntax
Plugin 'ekalinin/Dockerfile.vim'		"dockerfile syntax
Plugin 'plasticboy/vim-markdown'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'suan/vim-instant-markdown'		" [sudo] npm -g install instant-markdown-d
Plugin 'cakebaker/scss-syntax.vim'		" sass 
" Plugin 'chase/vim-ansible-yaml'

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
"
" Vundle END

" let g:airline#extensions#tabline#enabled = 1
" default setting
set number " (nu) each line with its line number
set showcmd " (sc) Show (partial) command in the last line of the screen
set tabstop=4 "(ts) Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4 " (sw) Number of spaces to use for each step of (auto)indent.
syntax on "Syntax highlighting enables Vim to show parts of the text in another font or color
" filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
" helptags ~/.vim/doc
let $Tlist_Ctags_Cmd='/usr/local/bin/ctags'
map ,h :syntax sync fromstart<CR>
set tabpagemax=50
set pastetoggle=<F2>
set t_Co=256	" set vim 256 color

" vim setting
au filetype vim vmap # :s/^/" /<CR>
au filetype vim vmap @ :s/^" //<CR>

" bash setting
au filetype sh map ,, :!bash %&<CR>
au filetype sh vmap # :s/^/# /<CR>
au filetype sh vmap @ :s/^/# /<CR>
au filetype sh set shiftwidth=4
au filetype sh set expandtab
au filetype sh set softtabstop=4

" yml setting
au filetype yaml vmap # :s/^/# /<CR>

" haskell setting
au filetype haskell set tabstop=8		" tab == 8*space
au filetype haskell set expandtab		" 
au filetype haskell set softtabstop=4	" key tab == 4*space
au filetype haskell set shiftwidth=4
au filetype haskell set shiftround
au filetype haskell vmap # :s/^/-- /<CR>
au filetype haskell vmap @ :s/^-- //<CR>

" python setting
" set filetype=python
" au BufNewFile,BufRead *.py,*.pyw setf python
au filetype python set expandtab
au filetype python set softtabstop=4
let g:jedi#popup_on_dot = 0
" au Filetype python let g:jedi#show_call_signatures = 1
" au Filetype python let g:jedi#auto_vim_configuration = 1
" au Filetype python let g:jedi#auto_initialization = 1
" au Filetype python let g:jedi#use_tabs_not_buffers = 0
" au Filetype python let g:jedi#popup_select_first = 0
" au Filetype python let g:jedi#popup_on_dot = 1
au filetype python map ,, :!python3 %<CR>
au filetype python vmap # :s/^/# /<CR>
au filetype python vmap @ :s/^# //<CR>

" Dockerfile setting
au filetype Dockerfile vmap # :s/^/# /<CR>

" warp setting
set wrap
set linebreak
" set wrapmargin
" set textwidth
" set showbreak=>\ " (sbr) String to put at the start of lines that have been wrapped.

" end default setting

" Html setting
" au==autocmd
" au FileType html,php,javascript,css map ,, :!cd `dirname %`;./cpWWW.sh %;cd - <CR><CR>
" au FileType html,php iabbrev </ </<C-x><C-O>
au BufRead,BufNewFile *.scss set filetype=scss.css
au filetype html,php,javascript,scss.css set tabstop=4
au filetype html,php,javascript,scss.css set shiftwidth=4
au filetype html,php,javascript,scss.css set expandtab
au filetype javascript vmap # :s/^/\/\/ /<CR>
au filetype javascript vmap @ :s/^\/\/ //<CR>

" Java setting
au filetype java vmap # :s/^/\/\/ /<CR>
au filetype java map ,, :!javac %; java %:r<CR>


" vim with binary
" nnoremap <C-H> :Hexmode<CR>
" inoremap <C-H> <Esc>:Hexmode<CR>
" vnoremap <C-H> :<C-U>Hexmode<CR>
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|lib)$'		" ignore node_modules, lib

" rst setting
let g:riv_fold_auto_update=0								" rst don't auto collapse

" rst settings
au filetype rst set fdls=1									" rst folding level == 1
au filetype rst set nowrap
au filetype rst nmap ,r :InstantRst<CR>

" markdown .md setting
au filetype mkd nmap ,t :TableFormat<CR>
let g:vim_markdown_folding_disabled=1						" disable folding
" markdown instant
let g:instant_markdown_autostart = 0						" :InstantMarkdownPreview
" let g:instant_markdown_slow = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_ignore_files = ['**.json', 'node_modules/', 'bower_components/', 'lib/']
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" typescript
let g:typescript_indent_disable = 1

" pangloss/vim-javascript
set regexpengine=1

" othree/javascript-libraries-syntax.vim
" let g:used_javascript_libs = 'underscore,angularjs,jquery'
" au filetype javascript let b:javascript_lib_use_jquery = 1
" au filetype javascript let b:javascript_lib_use_underscore = 1
" au filetype javascript let b:javascript_lib_use_angularjs = 1

" easymotion setting
let mapleader = ",,"
nmap s <Plug>(easymotion-s2)
omap / <Plug>(easymotion-tn)
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap t <Plug>(easymotion-t2)
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)
