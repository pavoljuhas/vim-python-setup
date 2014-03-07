" Python-related user commands.

if exists("loaded_pycommands")
    finish
endif
let loaded_pycommands = 1


command! -bar -bang PyShellHere put<bang> =
            \ repeat(' ', indent(line('.') + 1)) .
            \ 'from IPython import embed; embed()'

command! -nargs=1 -bar PyFind
            \ if empty(pythonlookuplib#FindPythonName(<f-args>, 1)) <bar>
            \     find <args> <bar>
            \ endif

command! -range -bar PyBreak
            \ <line1>,<line2>call pythonlookuplib#AddBreakToPdbrc()

command! -bar PyUTF8 1put ='# -*- coding: utf-8 -*-'

command! -bar PyPasteTraceback call pythonlookuplib#PyPasteTraceback()
