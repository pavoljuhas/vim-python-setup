" add tagfiles from ~/.vim/tagfiles per all imported Python modules

let s:modnames = pythonlookuplib#FindAllImports(1)
let s:tagpaths = map(s:modnames,
            \ 'expand("~/.vim/tagfiles/") . v:val . ".tags"')
let s:tagpaths = filter(s:tagpaths, 'filereadable(v:val)')
let s:tagpaths = map(s:tagpaths, 'resolve(v:val)')

execute 'setlocal' 'tags+=' . join(s:tagpaths, ',')
