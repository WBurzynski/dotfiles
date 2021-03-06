" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Always show tabs
set showtabline=2

set noshowmode
" Switch to next buffer with tab
nnoremap <silent> <TAB> :bnext<CR>
" Switch to previous buffer with shift-tab
nnoremap <silent> <S-TAB> :bprevious<CR>
