" matplotlib abbreviations for python
" vim: fdm=marker

" properties abbreviations {{{1
inoreabb <silent> <buffer> 0adj <c-o>:call <SID>FixPrefix()<cr>adjustable
inoreabb <silent> <buffer> 0ani <c-o>:call <SID>FixPrefix()<cr>animated
inoreabb <silent> <buffer> 0aal <c-o>:call <SID>FixPrefix()<cr>antialiased
inoreabb <silent> <buffer> 0asp <c-o>:call <SID>FixPrefix()<cr>aspect
inoreabb <silent> <buffer> 0asc <c-o>:call <SID>FixPrefix()<cr>autoscale_on
inoreabb <silent> <buffer> 0ascx <c-o>:call <SID>FixPrefix()<cr>autoscalex_on
inoreabb <silent> <buffer> 0ascy <c-o>:call <SID>FixPrefix()<cr>autoscaley_on
inoreabb <silent> <buffer> 0ax <c-o>:call <SID>FixPrefix()<cr>axes
inoreabb <silent> <buffer> 0axloc <c-o>:call <SID>FixPrefix()<cr>axes_locator
inoreabb <silent> <buffer> 0axbg <c-o>:call <SID>FixPrefix()<cr>axis_bgcolor
inoreabb <buffer> 0bbi bbox_inches
inoreabb <silent> <buffer> 0ch <c-o>:call <SID>FixPrefix()<cr>children
inoreabb <silent> <buffer> 0clb <c-o>:call <SID>FixPrefix()<cr>clip_box
inoreabb <silent> <buffer> 0clo <c-o>:call <SID>FixPrefix()<cr>clip_on
inoreabb <silent> <buffer> 0clp <c-o>:call <SID>FixPrefix()<cr>clip_path
inoreabb <silent> <buffer> 0c <c-o>:call <SID>FixPrefix()<cr>color
inoreabb <silent> <buffer> 0dcs <c-o>:call <SID>FixPrefix()<cr>dash_capstyle
inoreabb <silent> <buffer> 0djs <c-o>:call <SID>FixPrefix()<cr>dash_joinstyle
inoreabb <silent> <buffer> 0da <c-o>:call <SID>FixPrefix()<cr>data
inoreabb <silent> <buffer> 0dr <c-o>:call <SID>FixPrefix()<cr>data_ratio
inoreabb <silent> <buffer> 0ds <c-o>:call <SID>FixPrefix()<cr>drawstyle
inoreabb <silent> <buffer> 0ec <c-o>:call <SID>FixPrefix()<cr>edgecolor
inoreabb <silent> <buffer> 0fs <c-o>:call <SID>FixPrefix()<cr>fontsize
inoreabb <silent> <buffer> 0fw <c-o>:call <SID>FixPrefix()<cr>fontweight
inoreabb <silent> <buffer> 0fc <c-o>:call <SID>FixPrefix()<cr>facecolor
inoreabb <silent> <buffer> 0fh <c-o>:call <SID>FixPrefix()<cr>figheight
inoreabb <silent> <buffer> 0fi <c-o>:call <SID>FixPrefix()<cr>figure
inoreabb <silent> <buffer> 0fwi <c-o>:call <SID>FixPrefix()<cr>figwidth
inoreabb <silent> <buffer> 0fst <c-o>:call <SID>FixPrefix()<cr>fillstyle
inoreabb <silent> <buffer> 0fm <c-o>:call <SID>FixPrefix()<cr>frame
inoreabb <silent> <buffer> 0fmo <c-o>:call <SID>FixPrefix()<cr>frameon
inoreabb <silent> <buffer> 0gm <c-o>:call <SID>FixPrefix()<cr>geometry
inoreabb <silent> <buffer> 0ha <c-o>:call <SID>FixPrefix()<cr>horizontalalignment
inoreabb <silent> <buffer> 0img <c-o>:call <SID>FixPrefix()<cr>images
inoreabb <silent> <buffer> 0lb <c-o>:call <SID>FixPrefix()<cr>label
inoreabb <silent> <buffer> 0lg <c-o>:call <SID>FixPrefix()<cr>legend
inoreabb <silent> <buffer> 0lglb <c-o>:call <SID>FixPrefix()<cr>legend_handles_labels
inoreabb <silent> <buffer> 0li <c-o>:call <SID>FixPrefix()<cr>lines
inoreabb <silent> <buffer> 0ls <c-o>:call <SID>FixPrefix()<cr>linestyle
inoreabb <silent> <buffer> 0lw <c-o>:call <SID>FixPrefix()<cr>linewidth
inoreabb <silent> <buffer> 0m <c-o>:call <SID>FixPrefix()<cr>marker
inoreabb <silent> <buffer> 0mec <c-o>:call <SID>FixPrefix()<cr>markeredgecolor
inoreabb <silent> <buffer> 0mew <c-o>:call <SID>FixPrefix()<cr>markeredgewidth
inoreabb <silent> <buffer> 0mfc <c-o>:call <SID>FixPrefix()<cr>markerfacecolor
inoreabb <silent> <buffer> 0ms <c-o>:call <SID>FixPrefix()<cr>markersize
inoreabb <silent> <buffer> 0ml <c-o>:call <SID>FixPrefix()<cr>minor_locator
inoreabb <silent> <buffer> 0ML MultipleLocator
inoreabb <silent> <buffer> 0n <c-o>:call <SID>FixPrefix()<cr>name
inoreabb <silent> <buffer> 0nv <c-o>:call <SID>FixPrefix()<cr>navigate
inoreabb <silent> <buffer> 0nvm <c-o>:call <SID>FixPrefix()<cr>navigate_mode
inoreabb <buffer> 0o orientation
inoreabb <silent> <buffer> 0pa <c-o>:call <SID>FixPrefix()<cr>path
inoreabb <buffer> 0pt papertype
inoreabb <silent> <buffer> 0p <c-o>:call <SID>FixPrefix()<cr>position
inoreabb <silent> <buffer> 0r <c-o>:call <SID>FixPrefix()<cr>rotation
inoreabb <silent> <buffer> 0rotm <c-o>:call <SID>FixPrefix()<cr>rotation_mode
inoreabb <silent> <buffer> 0shx <c-o>:call <SID>FixPrefix()<cr>shared_x_axes
inoreabb <silent> <buffer> 0shy <c-o>:call <SID>FixPrefix()<cr>shared_y_axes
inoreabb <silent> <buffer> 0s <c-o>:call <SID>FixPrefix()<cr>size
inoreabb <silent> <buffer> 0si <c-o>:call <SID>FixPrefix()<cr>size_inches
inoreabb <silent> <buffer> 0scs <c-o>:call <SID>FixPrefix()<cr>solid_capstyle
inoreabb <silent> <buffer> 0sjs <c-o>:call <SID>FixPrefix()<cr>solid_joinstyle
inoreabb <silent> <buffer> 0sr <c-o>:call <SID>FixPrefix()<cr>stretch
inoreabb <silent> <buffer> 0st <c-o>:call <SID>FixPrefix()<cr>style
inoreabb <silent> <buffer> 0tx <c-o>:call <SID>FixPrefix()<cr>text
inoreabb <silent> <buffer> 0ti <c-o>:call <SID>FixPrefix()<cr>title
inoreabb <silent> <buffer> 0tn <c-o>:call <SID>FixPrefix()<cr>transform
inoreabb <silent> <buffer> 0vr <c-o>:call <SID>FixPrefix()<cr>variant
inoreabb <silent> <buffer> 0va <c-o>:call <SID>FixPrefix()<cr>verticalalignment
inoreabb <silent> <buffer> 0vi <c-o>:call <SID>FixPrefix()<cr>visible
inoreabb <silent> <buffer> 0wt <c-o>:call <SID>FixPrefix()<cr>weight
inoreabb <silent> <buffer> 0we <c-o>:call <SID>FixPrefix()<cr>window_extent
inoreabb <silent> <buffer> 0xax <c-o>:call <SID>FixPrefix()<cr>xaxis
inoreabb <silent> <buffer> 0xaxt <c-o>:call <SID>FixPrefix()<cr>xaxis_transform
inoreabb <silent> <buffer> 0xb <c-o>:call <SID>FixPrefix()<cr>xbound
inoreabb <silent> <buffer> 0x <c-o>:call <SID>FixPrefix()<cr>xdata
inoreabb <silent> <buffer> 0xg <c-o>:call <SID>FixPrefix()<cr>xgridlines
inoreabb <silent> <buffer> 0xlb <c-o>:call <SID>FixPrefix()<cr>xlabel
inoreabb <silent> <buffer> 0xl <c-o>:call <SID>FixPrefix()<cr>xlim
inoreabb <silent> <buffer> 0xs <c-o>:call <SID>FixPrefix()<cr>xscale
inoreabb <silent> <buffer> 0xtl <c-o>:call <SID>FixPrefix()<cr>xticklabels
inoreabb <silent> <buffer> 0xtln <c-o>:call <SID>FixPrefix()<cr>xticklines
inoreabb <silent> <buffer> 0xt <c-o>:call <SID>FixPrefix()<cr>xticks
inoreabb <silent> <buffer> 0xy <c-o>:call <SID>FixPrefix()<cr>xydata
inoreabb <silent> <buffer> 0yax <c-o>:call <SID>FixPrefix()<cr>yaxis
inoreabb <silent> <buffer> 0yaxt <c-o>:call <SID>FixPrefix()<cr>yaxis_transform
inoreabb <silent> <buffer> 0yb <c-o>:call <SID>FixPrefix()<cr>ybound
inoreabb <silent> <buffer> 0y <c-o>:call <SID>FixPrefix()<cr>ydata
inoreabb <silent> <buffer> 0yg <c-o>:call <SID>FixPrefix()<cr>ygridlines
inoreabb <silent> <buffer> 0ylb <c-o>:call <SID>FixPrefix()<cr>ylabel
inoreabb <silent> <buffer> 0yl <c-o>:call <SID>FixPrefix()<cr>ylim
inoreabb <silent> <buffer> 0ys <c-o>:call <SID>FixPrefix()<cr>yscale
inoreabb <silent> <buffer> 0ytl <c-o>:call <SID>FixPrefix()<cr>yticklabels
inoreabb <silent> <buffer> 0ytln <c-o>:call <SID>FixPrefix()<cr>yticklines
inoreabb <silent> <buffer> 0yt <c-o>:call <SID>FixPrefix()<cr>yticks
inoreabb <silent> <buffer> 0zo <c-o>:call <SID>FixPrefix()<cr>zorder

" values abbreviations {{{1
inoreabb <buffer> 1ax 'axes'
inoreabb <buffer> 1au 'auto'
inoreabb <buffer> 1b 'bold'
inoreabb <buffer> 1ba 'baseline'
inoreabb <buffer> 1bo 'bottom'
inoreabb <buffer> 1ca 'cap'
inoreabb <buffer> 1ce 'center'
inoreabb <buffer> 1d 'default'
inoreabb <buffer> 1da 'data'
inoreabb <buffer> 1fi 'figure'
inoreabb <buffer> 1i 'italic'
inoreabb <buffer> 1in 'inches'
inoreabb <buffer> 1l 'line'
inoreabb <buffer> 1la 'landscape'
inoreabb <buffer> 1le 'left'
inoreabb <buffer> 1li 'linear'
inoreabb <buffer> 1lo 'log'
inoreabb <buffer> 1m 'middle'
inoreabb <buffer> 1ma 'manual'
inoreabb <buffer> 1no 'none'
inoreabb <buffer> 1nr 'normal'
inoreabb <buffer> 1p 'patch'
inoreabb <buffer> 1po 'portrait'
inoreabb <buffer> 1pt 'points'
inoreabb <buffer> 1px 'pixels'
inoreabb <buffer> 1r 'right'
inoreabb <buffer> 1re 'replace'
inoreabb <buffer> 1t 'top'
inoreabb <buffer> 1tx 'text'
inoreabb <buffer> 1ti 'tight'
" }}}

" s:FixPrefix removes space to a preceding set or get function {{{1
if exists("*s:FixPrefix")
    finish
endif

function! s:FixPrefix()
    let prefix = strpart(getline('.'), 0, col('.'))
    if prefix =~ '\<[sg]et_\? \+$'
        normal! dFtst_
    endif
endfunction
