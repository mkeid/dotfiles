set background=dark
set laststatus=2
set nu
set tabstop=4
colorscheme one
filetype plugin indent on
syntax on

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
" If installed using git
" set rtp+=~/.fzf


""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""

map <C-b> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" For quick pane changes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""

" Close nerdtree if last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle - plugin manager for vim
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'

Plugin 'airblade/vim-gitgutter'

Plugin 'sjl/gundo.vim' " Show program history

Plugin 'itchyny/lightline.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-eunuch'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'aperezdc/vim-template'

Plugin 'rhysd/vim-clang-format'

call vundle#end()
