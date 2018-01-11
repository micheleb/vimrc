set nocp

call plug#begin('~/.vim/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --js-completer --tern-completer
  endif
endfunction

Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'myusuf3/numbers.vim'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'powerline/powerline'
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'xolox/vim-misc'

call plug#end()

if $TMUX == ''
    set clipboard+=unnamed
endif

syntax on
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim
set t_Co=256
set encoding=utf-8
set background=dark
set colorcolumn=80
colorscheme monokai
set tabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<F2>
set backup
set directory=~/.vim/swapfiles/

nmap <F3> ysiw
nmap <F4> cs
nmap <F5> ds
" navigate between panes in a more natural way
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" use fzf to search for files
nnoremap ? :GFiles<CR>

" split panes to the right and below
set splitbelow
set splitright
autocmd BufWritePre * StripWhitespace
hi Normal ctermbg=none
highlight NonText ctermbg=none
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

nmap <F3> ysiw
nmap <F4> cs
nmap <F5> ds

let mapleader = "\<Space>"
" nmap <Leader><Leader> :YcmCompleter GoTo<CR>
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map / <Plug>(incsearch-easymotion-/)

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:jsx_ext_required=0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_typescript_checkers=['tslint']

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
let g:Powerline_symbols='fancy'
set laststatus=2
let g:numbers_exclude=['nerdtree']
highlight LineNr ctermbg=39

let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1

let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.less,*.scss,*.json,*.md PrettierAsync

au BufNewFile *.py 0r ~/.vim/templates/python.template

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
