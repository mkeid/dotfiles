colorscheme one
filetype plugin indent on
syntax on

set nocompatible
set t_Co=256

set background=dark
set cursorline
hi CursorLine cterm=NONE ctermfg=NONE
set encoding=utf-8
set laststatus=2
set mouse=a
set nu
set tabstop=4



" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
" If installed using git
" set rtp+=~/.fzf

""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""

map <C-b> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" fzf mappings
nnoremap <C-_> :History:<CR>
nnoremap <silent> <Leader>F :Files<CR>
nnoremap <silent> <Leader>f :GFiles<CR>
nnoremap <silent> <Leader><Leader> :FZFMru<CR>
nnoremap <silent> <Leader>C :Commits<CR>
nnoremap <silent> <Leader>c :Colors<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <Leader>b :Buffers <CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <Leader>H :History<CR>
nnoremap <Leader>s :GGrep<space>
nnoremap <Leader>S :GGrep<space><C-r><C-w><CR>

" For quick pane changes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quality of life improvements
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wall wall
cnoreabbrev Qall qall

" Run python on current file
autocmd FileType python nnoremap <buffer> <Leader>r :exec '!python' shellescape(@%, 1)<cr>

" Switch between buffers
nnoremap <silent> <Leader>[ :bprev<CR>
nnoremap <silent> <Leader>] :bnext<CR>

" Close buffer
nnoremap <C-C> :bd<CR>

""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""

" Close nerdtree if last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close quickfix if last buffer
autocmd BufWinEnter quickfix nnoremap <silent> <buffer> q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) | bd | q | endif

" Set tab sizes for different file extensions
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType cpp setlocal ts=2 sts=2 sw=2


let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:gtest#gtest_command = "ctest -T test --output-on-failure"

""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle - plugin manager for vim
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'aitjcize/cppman'
Plugin 'alepez/vim-gtest'
Plugin 'ap/vim-buftabline'
Plugin 'bazelbuild/vim-bazel'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'qpkorr/vim-bufkill'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim' " Show program history
Plugin 'skywind3000/asyncrun.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vhdirk/vim-cmake'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'

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

