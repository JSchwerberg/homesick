set shell=/bin/bash
set t_Co=256
set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'lokaltog/vim-powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle "lepture/vim-jinja"
Plugin 'tmhedberg/SimpylFold'
Plugin 'lifepillar/vim-solarized8'
Plugin 'derekwyatt/vim-scala'
Plugin 'Shougo/deoplete.nvim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki'
Plugin 'rust-lang/rust.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'hashivim/vim-terraform'
Plugin 'flowtype/vim-flow'
Plugin 'mrk21/yaml-vim'
Plugin 'andrewstuart/vim-kubernetes'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'sebdah/vim-delve'
Plugin 'vim-airline/vim-airline'
Plugin 'jvirtanen/vim-hcl'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

if !has('nvim')
    set ttymouse=xterm2
endif

set mouse=a

let g:deoplete#enable_at_startup = 1
let g:javascript_plugin_flow = 1

syntax enable
set list
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1


set background=dark
colorscheme solarized8
hi NonText ctermfg=111 guifg=#87afff
hi SpecialKey ctermfg=111 guifg=#87afff

map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDtree
let g:NERDTreeChDirMode = 2

set scrolloff=999
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set nu
set expandtab

nnoremap <space> za

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=119 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2

au BufNewFile,BufRead *.tf
    \ setlocal tabstop=2 |
    \ setlocal shiftwidth=2 |
    \ setlocal expandtab

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.html.j2 set ft=jinja

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePre * %s/\s\+$//e

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
