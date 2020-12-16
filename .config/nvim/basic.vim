" set space to be leader key
map <Space> <NOP>
let mapleader =" "

"enable syntax highlightning
syntax on

"draw line on column last column
set colorcolumn=100

"set tab width to 4
set tabstop=4 softtabstop=4 shiftwidth=4

"enable line numbering and set it to absolute
set number

"highlight current line
set cursorline

"highlight current column
"set cursorcolumn

"disable highlightning of all occurences of completed search
" set nohlsearch

"highlight first occurence of search
set incsearch

"incrementally show effects of command
set inccommand=nosplit

"refresh file that was changed outside neovim
set autoread

"save undo history
set undofile

"hide current buffer when switching buffers, instead of unloading it
set hidden

set updatetime=50
set shortmess+=c

"auto indentation
set smartindent

"ingore letter case when searching, unless ppattern contains upper case letters
set ignorecase
set smartcase

set noswapfile
set noshowmode

" recomended by CoC
set nobackup
set nowritebackup

" enable mouse in all modes
set mouse=a

"disable wrapping of long lines
set nowrap

"enable 24-bit color
set termguicolors

" toggle highlightning of all search occurences
noremap <Leader>h :set hlsearch! hlsearch?<CR>

" close buffer
noremap <Leader>bc :bd<CR>

" folding brackets
set foldmethod=marker
set foldmarker={,}
set foldcolumn=3

" persistent folds across vim sessions
autocmd BufWinLeave *.* mkview 
autocmd BufWinEnter *.* silent loadview

let g:netrw_banner=0
let g:netrw_bufsettings='noma nomod nu nobl nowrap ro'
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %

" copy to system clipboard (visual mode)
vmap cp "+y

" copy to system clipboard (normal mode)
nnoremap cp "+y

" Coc navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap cpp "+yy
nnoremap zp "+p
nnoremap zP "+P
map <C-c> :w! \| !clear && compiler <c-r>%<CR>
map <C-p> :!clear && printVim <c-r>%<CR><CR>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Dot :execute ':!dotInstall'
command So :execute ':so $HOME/.config/nvim/init.vim' | :edit!
tnoremap <C-w> <C-\><C-n>
tnoremap ,, <C-\><C-n>
nnoremap <leader>un :UndotreeToggle<cr>

" quit neovim
map Q :q!<CR>

map <leader>acl :set list!<CR>

"edit file?
nmap <leader>f :Ex<CR>
nmap <leader>ef :Vex<CR>
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j

"map Alt + hjkl to resize tabs
map <A-h> :vertical resize -3<CR>
map <A-l> :vertical resize +3 <CR>
map <A-k> :resize +3<CR>
map <A-j> :resize -3<CR>

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Nightly build
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
