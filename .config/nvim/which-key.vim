let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map =  {}

let g:which_key_map['p'] = [ 'Files'  , 'open file' ]
let g:which_key_map['t'] = [ 'CocCommand terminal.Toggle'  , 'terminal' ]
let g:which_key_map['<F9>'] = [ '<Plug>VimspectorToggleConditionalBreakpoint'  , 'set conditional breakpoint' ]
let g:which_key_map['/'] = [ 'Commentary'  , 'comment line(s)' ]
let g:which_key_map['h'] = [ 'set hlsearch! hlsearch?'  , 'toggle search highlightning' ]

let g:which_key_map.d = {
      \ 'name' : '+debugger' ,
      \ 'd' : ['call vimspector#Launch()'        , 'run debugger']        ,
      \ 'e' : ['VimspectorEval'        , 'evaluate variable']        ,
      \ 'i' : ['CocDiagnostics'        , 'CocDiagnostics']   ,
      \ 'o' : ['VimspectorShowOutput'    , 'Show Output']    ,
      \ 'w' : ['VimspectorWatch'  , 'set watch']     ,
      \ 'x' : ['VimspectorReset'     , 'stop debugger']     ,
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : ['Buffers'        , 'show open buffers']        ,
      \ 'c' : ['bd'        , 'close buffer']        ,
      \ 'l' : ['rg'        , 'rg']   ,
      \ }
" Register which key map
call which_key#register('<Space>', "g:which_key_map")
