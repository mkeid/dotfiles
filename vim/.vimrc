set background=dark
set laststatus=2
set nu
set tabstop=4
set t_Co=256
colorscheme one
filetype plugin indent on
syntax on

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

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
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'aperezdc/vim-template'
Plugin 'vhdirk/vim-cmake'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'bazelbuild/vim-bazel'
Plugin 'Raimondi/delimitMate'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'google/vim-colorscheme-primary'
Plugin 'google/vim-searchindex'

call vundle#end()

"""""""""""""""""""""""""""
" Formatting
"""""""""""""""""""""""""""

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END


autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType cpp setlocal ts=2 sts=2 sw=2
