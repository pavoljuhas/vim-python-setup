" settings
setlocal expandtab
setlocal softtabstop=4
setlocal complete+=k~/.ipython/tags
setlocal tags-=./tags tags^=./tags;;
setlocal path-=/usr/include path^=.;;
setlocal suffixesadd=.py
setlocal textwidth=78
setlocal formatoptions+=l

" mappings
" grep files in the current directory
noremap <silent> <buffer> <Plug>GrepThisWord
            \ :call pjvimlib#VimGrepCWord('%:h/*.py')<CR>
noremap <silent> <buffer> <Plug>RecurseGrepThisWord
            \ :call pjvimlib#VimGrepCWord('%:h/**/*.py')<CR>

" flip comments with \q \Q
noremap <buffer> <Leader>q :s/^ \?/#/ <bar> nohlsearch <bar> ']+1 <cr>
noremap <buffer> <Leader>Q :s/^#/\=getline(".") =~ '^# ' ? ' ' : ''<cr>
	    \:nohlsearch<bar>']+1<cr>

" <F2> fills clipboard with breakpoint statement for pdb
nnoremap <buffer> <silent> <F2>
	    \ :let @*="b ".expand("%:p").":".line(".") <bar>
	    \ echo "b ".expand("%:t").":".line(".")<CR>

nnoremap <buffer> <silent>
            \ gf :<C-U>call pythonlookuplib#FindCurrentWord()<CR>

" compiler python
compiler pyunit
