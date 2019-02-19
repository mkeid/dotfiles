set background=dark
set laststatus=2
set nu
set tabstop=4

colorscheme one
filetype plugin indent on
syntax on

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
" If installed using git
" set rtp+=~/.fzf

""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle - plugin manager for vim
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
map <C-b> :NERDTreeToggle<CR>

Plugin 'airblade/vim-gitgutter'

Plugin 'sjl/gundo.vim' " Show program history
nnoremap <F5> :GundoToggle<CR>

Plugin 'itchyny/lightline.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-eunuch'

Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()
