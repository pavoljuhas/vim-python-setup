function! pythonlookuplib#PyPasteTraceback()
    let save_errorformat = &errorformat
    let bn = bufnr('%')
    set errorformat=
            \('%f'\\,\ %l\\,\ %m),
            \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
            \%C\ \ \ \ %.%#,
            \%+Z%.%#Error\:\ %.%#,
            \%A\ \ File\ \"%f\"\\\,\ line\ %l,
            \%+C\ \ %.%#,
            \%-C%p^,
            \%Z%m,
            \%-G%.%#
    cgetexpr @*
    let &errorformat = save_errorformat
endfunction


function! pythonlookuplib#FindPythonModule(modname)
    let rv = {}
    " (1) search for it in the python path
    if !has('python')
        return rv
    endif
    if !exists('s:pypath')
        python import sys, os, vim
        python vim.command('let s:pypath = %r' %
                    \ ','.join(sys.path).replace(os.sep, '/'))
    endif
    let save_sufixesadd = &suffixesadd
    set suffixesadd+=.py
    " check if it was not renamed on import
    let p = '^ *import \+\(\S\+\) \+as \+' . a:modname . '\>'
    let n = search(p, 'bWn')
    let mn = (n > 0) ? matchlist(getline(n), p)[1] : a:modname
    " here we have resolved module name, let's convert to path
    let mp = substitute(mn, '[.]', '/', 'g')
    let f = findfile(mp, s:pypath)
    let f = (f != '') ? f : findfile(mp . '/__init__', s:pypath)
    let &suffixesadd = save_sufixesadd
    if f != ''
        let rv.name = a:modname
        let rv.cmd = 0
        let rv.static = 0
        let rv.kind = ''
        let rv.filename = f
    endif
    return rv
endfunction


function! pythonlookuplib#FindPythonObject(modname, objname)
    let rv = {}
    let md = pythonlookuplib#FindPythonModule(a:modname)
    if empty(md)
        return rv
    endif
    call s:DefinePyCodeTagger()
    let mp = resolve(md.filename)
    python import vim
    python vim.command('let toptags = %r' % PyCodeTagger.gettags(vim.eval('mp')))
    if !has_key(toptags, a:objname)
        return rv
    endif
    let rv.name = a:objname
    let rv.cmd = toptags[a:objname]
    let rv.static = 0
    let rv.kind = ''
    let rv.filename = mp
    return rv
endfunction


function! pythonlookuplib#FindPythonName(name, enter)
    let rv = pythonlookuplib#FindPythonModule(a:name)
    let w = split(a:name, '[.]\ze[^.]*$')
    let rv = (empty(rv) && len(w) == 2) ?
                \ pythonlookuplib#FindPythonObject(w[0], w[1]) : rv
    if len(rv) && a:enter
        execute 'edit' (rv.cmd ? ('+' . rv.cmd) : '') fnameescape(rv.filename)
    endif
    return rv
endfunction


function! pythonlookuplib#FindCurrentWord()
    try
        normal! gf
        let cf = expand('%')
        if isdirectory(cf) && filereadable(cf . '/__init__.py')
            execute 'edit' fnameescape(cf . '/__init__.py')
        endif
        return
    catch /^Vim\%((\a\+)\)\=:\(E345\|E447\)/
    endtry
    let cw = expand('<cfile>')
    if len(pythonlookuplib#FindPythonName(cw, 1))
        return
    endif
    " helper function for extracting full import strings
    let fullpyname = {}
    function fullpyname.extract(pattern, i0, i1) dict
        let n0 = search(a:pattern, 'cbWn')
        let n1 = (n0 <= 0) ? n0 : n0 + 20
        let txt = (n0 <= 0) ? "" : join(getline(n0, n1), "\n")
        let mxl = matchlist(txt, a:pattern)
        let name = (n0 <= 0) ? "" : (mxl[a:i0] . '.' . mxl[a:i1])
        return name
    endfunction
    " import with the 'from' syntax
    let p = '^ *from *\(\S\+\) \+import[([:blank:]]\%(.*, *\\\?\_s*\)*.*' .
                \ '\<\(' . cw . '\)\>'
    let name = fullpyname.extract(p, 1, 2)
    if !empty(name) && len(pythonlookuplib#FindPythonName(name, 1))
        return
    endif
    " import with the 'from ... as' syntax
    let p = '^ *from *\(\S\+\) \+import\_[\\\\[:space:]]\+\(\k\+\) \+as \+' .
                \ '\<\(' .  cw . '\)\>'
    let name = '' " fullpyname.extract(p, 1, 2)
    if !empty(name) && len(pythonlookuplib#FindPythonName(name, 1))
        return
    endif
    " everything failed, let's just do standard gf and let it fail
    normal! gf
endfunction


function! pythonlookuplib#AddBreakToPdbrc() range
    let cmd = 'break ' . expand('%:p') . ':' . a:firstline
    let pat = escape(cmd, '\\/.*$^~[]')
    badd ~/.pdbrc
    sbuffer ~/.pdbrc
    if search(pat, 'w') == 0
        $put =cmd
    endif
endfunction


function! pythonlookuplib#FindAllImports(...)
    let parents = a:0 ? (a:1 != 0) : 0
    let lines = getline(1, '$')
    let lines = filter(lines, 'v:val =~ "^[^#]*import\\s"')
    let implines = filter(copy(lines), 'v:val =~ "^\\s*import\\s\\+\\S"')
    let imppat = '\s*import \+\(\w[[:alnum:]_.]*\%( *, *\w[[:alnum:]_.]*\)*\)'
    let impnames = map(implines, 'substitute(v:val, imppat, "\\1", "")')
    let modnames = {}
    for m1 in impnames
        for m2 in split(m1, '[[:blank:],]\+')
            let modnames[m2] = 1
        endfor
    endfor
    let frompat = '^\s*from \+\(\w[[:alnum:]_.]*\) \+import .*'
    let fromlines = filter(lines, 'v:val =~ frompat')
    let fromnames = map(fromlines, 'substitute(v:val, frompat, "\\1", "")')
    for m1 in fromnames
        let modnames[m1] = 1
    endfor
    if parents
        for m1 in keys(modnames)
            let w = split(m1, '\.')
            for i in range(len(w) - 1)
                let modnames[join(w[:i], '.')] = 1
            endfor
        endfor
    endif
    return keys(modnames)
endfunction


function! s:DefinePyCodeTagger()
    if exists('s:did_PyCodeTagger')
        return
    endif
    let s:did_PyCodeTagger = 1

    python << END
class PyCodeTagger(object):

    import ast
    _tagged = {}
    _mtimes = {}

    @staticmethod
    def gettags(filename):
        import os, ast
        _mtimes = PyCodeTagger._mtimes
        _tagged = PyCodeTagger._tagged
        cached = _mtimes.get(filename, 0) == os.path.getmtime(filename)
        if not cached:
            _mtimes[filename] = os.path.getmtime(filename)
            topnode = ast.parse(open(filename).read(), filename)
            visitor = PyCodeTagger.TagTopObjects()
            visitor.visit(topnode)
            _tagged[filename] = visitor.tags
        return _tagged[filename]

    class TagTopObjects(ast.NodeVisitor):

        def __init__(self):
            import ast
            ast.NodeVisitor.__init__(self)
            self.tags = {}
            return

        def tagnode(self, node, name):
            if node.col_offset:  return
            self.tags[name] = node.lineno
            return

        def visit_Name(self, node):
            return self.tagnode(node, node.id)

        def visit_Import(self, node):
            for a in node.names:
                n = a.asname or a.name
                self.tagnode(node, n)
            return

        def visit_ImportFrom(self, node):
            return self.visit_Import(node)

        def visit_ClassDef(self, node):
            return self.tagnode(node, node.name)

        def visit_FunctionDef(self, node):
            return self.tagnode(node, node.name)

    # end of class TagTopObjects

# end of class PyCodeTagger
END
endfunction
