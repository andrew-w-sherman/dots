" Enable modern Vim features not compatible with Vi spec.
set nocompatible
filetype off

" mouse support and controlc copying
set ttyfast
set mouse=a
vmap <C-c> "+y

" setlocal foldmethod=n
" nnoremap <space> za
" noremap <RightMouse> <LeftMouse>za

set number
set undofile

highlight ColorColumn ctermbg=red
highlight Folded ctermbg=8
highlight Folded ctermfg=11
highlight Visual ctermbg=black

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug' " to get documentation
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-sensible'
Plug 'spf13/vim-autoclose'
Plug 'xolox/vim-misc'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

call plug#end()

set wildmode=longest,list,full
set wildmenu

" Make splits usable
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" cool tab stuff
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

let g:airline_powerline_fonts = 0

filetype plugin indent on
syntax on
