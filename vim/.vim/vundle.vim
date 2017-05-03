" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_home=expand('~/.vim/bundle/Vundle.vim')

if !isdirectory(vundle_home) 
    echo "Installing Vundle..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git plugin
Plugin 'tpope/vim-fugitive'

Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"...All your other bundles...
if iCanHazVundle == 0
    echo "Installing Vundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif


" All of your Plugins must be added before the following line
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
" Setting up Vundle - the vim plugin bundler end

" Get Airline to work at Startup
set laststatus=2

" Populate the g:airline_symbols dictionary with the proper font glyphs for various symbols.
let g:airline_powerline_fonts = 1
