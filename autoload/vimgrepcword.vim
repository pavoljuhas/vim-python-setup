function! vimgrepcword#VimGrepCWord(files)
    let cword = expand('<cword>')
    if cword == ''
        return
    endif
    let @/ =  escape(cword, '\\/.*$^~[]')
    execute 'vimgrep  /' . @/ . '/' a:files
endfunction
