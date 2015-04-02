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
" Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
" Plugin 'taglist', {'pinned': 1}	" local dir
" Plugin 'yamlvim', {'pinned': 1}	" local dir
" Plugin 'moll/vim-node'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Rykka/riv.vim'	"shpinx rst Plugin
Plugin 'Rykka/InstantRst' " sphinx web server
Plugin 'othree/html5.vim'
Plugin 'ekalinin/Dockerfile.vim' 	"dockerfile syntax
Plugin 'plasticboy/vim-markdown'

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

" riv.vim (sphinx)
" let proj1 = {'path': '~/git/bdwsa/documentation',}


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
au FileType vim vmap " :s/^/" /<CR>

" bash setting
au FileType sh map ,, :!bash %&<CR>
au FileType sh vmap # :s/^/#/<CR>
au FileType sh set shiftwidth=4

" python setting
" set filetype=python
" au BufNewFile,BufRead *.py,*.pyw setf python
au Filetype python set expandtab
au Filetype python set softtabstop=4
" au Filetype python let g:jedi#show_call_signatures = 1
" au Filetype python let g:jedi#auto_vim_configuration = 1
" au Filetype python let g:jedi#auto_initialization = 1
" au Filetype python let g:jedi#use_tabs_not_buffers = 0
" au Filetype python let g:jedi#popup_select_first = 0
" au Filetype python let g:jedi#popup_on_dot = 1
au Filetype python map ,, :!python3 %<CR>
au FileType python vmap # :s/^/#/<CR>

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
au FileType html,php,javascript set tabstop=2
au FileType html,php,javascript set shiftwidth=2
au FileType javascript vmap # :s/^/\/\/ /<CR>

" Java setting
au FileType java vmap # :s/^/\/\/ /<CR>
au FileType java map ,, :!javac %; java %:r<CR>


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

set nohlsearch
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|lib)$'		" ignore node_modules, lib
