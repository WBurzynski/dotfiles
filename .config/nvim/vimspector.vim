" enable more convenient shortcuts
let g:vimspector_enable_mappings = 'HUMAN'

" start debugging
nmap <leader>dd :call vimspector#Launch()<CR>

" stop debugging
nmap <leader>dx :VimspectorReset<CR>

" Evaluate expression
nmap <leader>de :VimspectorEval 

" set watch
nmap <leader>dw :VimspectorWatch 

" show program output
nmap <leader>do :VimspectorShowOutput 

" continue debugging
" nmap <leader>c <Plug>VimspectorContinue

" toggle breakpoint
" nmap <leader>tb <Plug>VimspectorToggleBreakpoint

" toggle conditional breakpoint
" nmap <leader>tcb <Plug>VimspectorToggleConditionalBreakpoint

" step over line
" nmap <leader>so <Plug>VimspectorStepOver

" step into line
" nmap <leader>si <Plug>VimspectorStepInto

" unassigned vimspector functions
" nmap <leader> <Plug>VimspectorAddFunctionBreakpoint
" nmap <leader> <Plug>VimspectorStepOut
" nmap <leader> <Plug>VimspectorRunToCursor
" nmap <leader> <Plug>VimspectorStop
" nmap <leader> <Plug>VimspectorRestart
" nmap <leader> <Plug>VimspectorPause

" override start debugging for java
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>
