colorscheme dracula
filetype plugin indent on
syntax on

set background=dark
set belloff=all
set cursorline
set encoding=utf-8
set laststatus=2
set mouse=a
set nocompatible
set nu
set rtp+=/usr/local/opt/fzf
set t_Co=256
set tabstop=4

""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""

map <C-b> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" Unmap arrow keys
no <left> <Nop>
no <down> <Nop>
no <up> <Nop>
no <right> <Nop>

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
autocmd FileType cpp,cc,h,hpp,proto setlocal ts=2 sts=2 sw=2

" YCM settings
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:gtest#gtest_command = "ctest -T test --output-on-failure"
let g:airline_theme='onedark'

""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle - plugin manager for vim
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'alepez/vim-gtest'
Plugin 'ap/vim-buftabline'
Plugin 'bazelbuild/vim-bazel'
Plugin 'flazz/vim-colorschemes'
Plugin 'gauteh/vim-cppman'
Plugin 'junegunn/fzf.vim'
Plugin 'mtth/scratch.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'qpkorr/vim-bufkill'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim' " Show program history
Plugin 'skywind3000/asyncrun.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vhdirk/vim-cmake'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'

Plugin 'google/vim-codefmt'
Plugin 'google/vim-colorscheme-primary'
Plugin 'google/vim-glaive'
Plugin 'google/vim-maktaba'
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

