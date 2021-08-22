" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    """ ESSENTIALS
    " Startify
    Plug 'mhinz/vim-startify'

    " Smooth scrolling
    Plug 'psliwka/vim-smoothie'
    
    " Multi cursor support
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    "" Icons
    Plug 'kyazdani42/nvim-web-devicons'

    "" Colorscheme
    Plug 'joshdick/onedark.vim'

    "Terminal
    Plug 'voldikss/vim-floaterm'

    " Better Syntax Support
     Plug 'sheerun/vim-polyglot'
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    
    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'

    "Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " IVY for VIM
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'

    " Which key ?
    Plug 'liuchengxu/vim-which-key'
    
    " Statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " Goyo zen mode
    Plug 'junegunn/goyo.vim' 

    " NERDCommenter
    Plug 'preservim/nerdcommenter'

    " FZF, big change
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    """ GIT
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    """ LANGUAGE SUPPORT
    " Coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'} 
    " Snippets
    Plug 'honza/vim-snippets' 

    " LSP language servers
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

call plug#end()
