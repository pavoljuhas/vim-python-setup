syn sync minlines=150

hi def link pythonSpaceError Error
"
" Highlight trailing whitespace, unless just in front of the cursor.
syn match   pythonSpaceError  display excludenl  "\s\+\%(\%#\)\@!$"

" Highlight mixed tabs and spaces.
syn match   pythonSpaceError  display " \+\t"
syn match   pythonSpaceError  display "\t\+ "
