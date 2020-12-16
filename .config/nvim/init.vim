" Install plugins with vim-plug
call plug#begin()
" intellisense, code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" code snippets
Plug 'honza/vim-snippets'
" git integration
Plug 'tpope/vim-fugitive'
" status bar
Plug 'vim-airline/vim-airline'
" auto-comment
Plug 'tpope/vim-commentary'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" debugger integration
Plug 'puremourning/vimspector'
" undo tree
Plug 'mbbill/undotree'
" colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'cseelus/vim-colors-lucid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'christophermca/meta5'
Plug 'fcpg/vim-orbital'
Plug 'jaredgorski/spacecamp'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'
Plug 'whatyouhide/vim-gotham'
" indent line
Plug 'Yggdroot/indentLine'
" leader key cheatsheet
Plug 'liuchengxu/vim-which-key'
" clang-format integration
Plug 'rhysd/vim-clang-format'
" braces completion
Plug 'jiangmiao/auto-pairs'
" syntax highlightning based on LSP
Plug 'jackguo380/vim-lsp-cxx-highlight'
" doxygen integration
Plug 'kkoomen/vim-doge', { 'do': { ->doge#install() }}
" TOML syntax highlightning
Plug 'cespare/vim-toml'
" GLSL highlightning
Plug 'tikhomirov/vim-glsl'
call plug#end()

" source configuration files
" neovim config
source $HOME/.config/nvim/basic.vim
" fugitive
source $HOME/.config/nvim/git.vim
" CoC
source $HOME/.config/nvim/coc.vim
" Commentry
source $HOME/.config/nvim/commentry.vim
" gruvbox
source $HOME/.config/nvim/colorscheme.vim
" fuzzyfinder
source $HOME/.config/nvim/fzf.vim
" debugger
source $HOME/.config/nvim/vimspector.vim
" status bar
source $HOME/.config/nvim/airline.vim
" latex
source $HOME/.config/nvim/latex.vim
" cheatsheet
source $HOME/.config/nvim/which-key.vim
" doxygen
source $HOME/.config/nvim/doge.vim
" indent
source $HOME/.config/nvim/indent.vim
"GLSL 
source $HOME/.config/nvim/glsl.vim
