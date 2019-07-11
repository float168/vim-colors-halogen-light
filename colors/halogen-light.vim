" NAME:     halogen-light.vim
" AUTHOR:   LUO Boming
" VERSION:  0.1
" URL:      https://github.com/float168/vim-colors-halogen-light
" LICENSE:  The MIT License


"{{{ Init
"------------------------------------------------------------------------------

let g:colors_name = '<sfile>:t:r'

hi clear
if exists('syntax_on')
   syntax reset
endif

" This is light colorscheme
set background=light

if ! exists('g:terminal_italics')
   let g:terminal_italics = 0
endif

if ! exists('g:spell_undercurl')
   let g:spell_undercurl = 0
endif

"------------------------------------------------------------------------------
"}}}

"{{{ Helper
"------------------------------------------------------------------------------

" Highlight function
function! s:hi(group, style)
   if g:terminal_italics == 0
      " If italics is not available, erase attribute
      if has_key(a:style, 'attr') && a:style['attr'] == 'italic'
         unlet a:style.attr
      endif
   endif

   execute 'highlight' a:group
   \ 'guifg='   (has_key(a:style, 'fg')   ? a:style.fg.gui   : 'NONE')
   \ 'guibg='   (has_key(a:style, 'bg')   ? a:style.bg.gui   : 'NONE')
   \ 'guisp='   (has_key(a:style, 'sp')   ? a:style.sp.gui   : 'NONE')
   \ 'gui='     (has_key(a:style, 'attr') ? a:style.attr     : 'NONE')
   \ 'ctermfg=' (has_key(a:style, 'fg')   ? a:style.fg.cterm : 'NONE')
   \ 'ctermbg=' (has_key(a:style, 'bg')   ? a:style.bg.cterm : 'NONE')
   \ 'cterm='   (has_key(a:style, 'attr') ? a:style.attr     : 'NONE')
   \ 'term='    (has_key(a:style, 'attr') ? a:style.attr     : 'NONE')
endfunction

"------------------------------------------------------------------------------
"}}}

"{{{  Palette
"------------------------------------------------------------------------------
" Reference: https://jonasjacek.github.io/colors/

" Color entities

let s:black        = {'gui': '#000000', 'cterm': '0'}
let s:dark_gray    = {'gui': '#3a3a3a', 'cterm': '237'}
let s:gray         = {'gui': '#767676', 'cterm': '243'}
let s:light_gray   = {'gui': '#bcbcbc', 'cterm': '250'}
let s:white_gray   = {'gui': '#eeeeee', 'cterm': '255'}
let s:white        = {'gui': '#ffffff', 'cterm': '15'}

let s:dark_orange  = {'gui': '#d9372d', 'cterm': '160'}
let s:light_orange = {'gui': '#eb5a7c', 'cterm': '204'}

let s:green        = {'gui': '#30b536', 'cterm': '34'}
let s:light_green  = {'gui': '#b7efa5', 'cterm': '157'}

let s:dark_cyan    = {'gui': '#00af87', 'cterm': '36'}
let s:cyan         = {'gui': '#34d0f1', 'cterm': '45'}
let s:light_cyan   = {'gui': '#d7ffff', 'cterm': '195'}

let s:blue         = {'gui': '#005fff', 'cterm': '27'}

let s:purple       = {'gui': '#b586e7', 'cterm': '141'}

let s:dark_pink    = {'gui': '#b365a2', 'cterm': '133'}
let s:pink         = {'gui': '#d36dd3', 'cterm': '170'}
let s:light_pink   = {'gui': '#fedcfe', 'cterm': '225'}


" Color Aliases

let s:fg            = s:black
let s:fg_gray       = s:gray
let s:fg_orange     = s:dark_orange
let s:fg_green      = s:green
let s:fg_cyan       = s:dark_cyan
let s:fg_blue       = s:blue
let s:fg_purple     = s:purple
let s:fg_pink       = s:dark_pink

let s:bg            = s:white
let s:bg_gray       = s:white_gray
let s:bg_orange     = s:light_orange
let s:bg_green      = s:light_green
let s:bg_cyan       = s:light_cyan
let s:bg_pink       = s:light_pink

"------------------------------------------------------------------------------
"}}}

"{{{ Builtin Highlighting Group
"------------------------------------------------------------------------------
" Based on 'highlight-default' tag section of 'syntax.txt'
" For more information, check by `:help syntax`

call s:hi('Normal',      {'fg': s:fg})
call s:hi('NormalNC',    {'fg': s:fg})
call s:hi('NormalFloat', {'fg': s:fg})

call s:hi('WhiteSpace', {'fg': s:fg_orange, 'attr': 'bold'})
call s:hi('NonText',    {'fg': s:bg_cyan,   'attr': 'bold'})
call s:hi('SpecialKey', {'fg': s:purple,    'attr': 'bold'})
call s:hi('MatchParen', {'fg': s:fg_pink,   'attr': 'underline'})

call s:hi('Conceal',   {'fg': s:fg_orange})
call s:hi('Directory', {'fg': s:fg_blue, 'attr': 'bold'})

call s:hi('DiffAdd',    {'bg': s:bg_green})
call s:hi('DiffChange', {'bg': s:bg_cyan})
call s:hi('DiffDelete', {'bg': s:bg_orange})
call s:hi('DiffText',   {'attr': 'bold'})

if has('gui_running')
   call s:hi('SpellBad',   {'attr': 'undercurl', 'sp': s:bg_orange})
   call s:hi('SpellCap',   {'attr': 'undercurl', 'sp': s:bg_pink})
   call s:hi('SpellLocal', {'attr': 'undercurl', 'sp': s:bg_green})
   call s:hi('SpellRare',  {'attr': 'undercurl', 'sp': s:bg_cyan})
else
   call s:hi('SpellBad',   {'fg': s:fg_orange, 'attr': 'underline'})
   call s:hi('SpellCap',   {'fg': s:fg_orange, 'attr': 'underline'})
   call s:hi('SpellLocal', {'fg': s:fg_green,  'attr': 'underline'})
   call s:hi('SpellRare',  {'fg': s:fg_blue,   'attr': 'underline'})
endif

call s:hi('Search',     {'fg': s:fg, 'bg': s:bg_pink})
call s:hi('IncSearch',  {'attr': 'reverse'})
call s:hi('Substitute', {'attr': 'reverse'})

call s:hi('LineNr',       {'fg': s:gray})
call s:hi('CursorLineNr', {'fg': s:fg_pink, 'attr': 'bold'})

call s:hi('Cursor',       {})
call s:hi('CursorIM',     {})
call s:hi('CursorColumn', {})
call s:hi('CursorLine',   {})
call s:hi('TermCursor',   {'bg': s:bg_green})
call s:hi('TermCursorNC', {'bg': s:bg_green})
call s:hi('QuickFixLine', {'fg': s:purple, 'attr': 'bold'})

call s:hi('ColorColumn', {'bg': s:bg_gray})

call s:hi('Visual',    {'attr': 'reverse'})
call s:hi('VisualNOS', {'attr': 'bold,underline'})

call s:hi('Folded',     {'fg': s:fg_green, 'bg': s:bg_gray})
call s:hi('FoldColumn', {'fg': s:fg_green, 'bg': s:bg_gray})

call s:hi('SignColumn', {'fg': s:fg_green, 'bg': s:bg_gray})

call s:hi('VertSplit', {'attr': 'reverse'})

call s:hi('EndOfBuffer', {'bg': s:bg_gray})

call s:hi('StatusLine',       {'fg': s:fg, 'bg': s:bg_green, 'attr': 'bold'})
call s:hi('StatusLineNC',     {'fg': s:fg, 'bg': s:bg_gray})
call s:hi('StatusLineTerm',   {'fg': s:fg, 'bg': s:bg_gray})
call s:hi('StatusLineTermNC', {'fg': s:fg, 'bg': s:bg_gray})

call s:hi('TabLine',     {'bg': s:bg_pink})
call s:hi('TabLineFill', {'bg': s:bg_pink})
call s:hi('TabLineSel',  {'bg': s:bg_pink})

call s:hi('Title', {'fg': s:fg_pink, 'attr': 'bold'})

call s:hi('MsgSeparator', {'fg': s:fg_pink,   'attr': 'bold'})
call s:hi('ErrorMsg',     {'fg': s:fg_orange, 'attr': 'bold'})
call s:hi('WarningMsg',   {'fg': s:fg_orange, 'attr': 'bold'})
call s:hi('ModeMsg',      {'fg': s:fg_pink,   'attr': 'bold'})
call s:hi('MoreMsg',      {'fg': s:fg_pink,   'attr': 'bold'})
call s:hi('Question',     {'fg': s:purple,    'attr': 'bold'})

call s:hi('Pmenu',      {'bg': s:bg_gray})
call s:hi('PmenuSel',   {'bg': s:bg_pink})
call s:hi('PmenuSbar',  {'bg': s:bg_gray})
call s:hi('PmenuThumb', {'bg': s:bg_gray})
call s:hi('WildMenu',   {'fg': s:fg, 'bg': s:bg_cyan})


" GUI only

call s:hi('Menu', {'fg': s:fg, 'bg': s:bg_cyan})

call s:hi('Scrollbar', {'fg': s:fg, 'bg': s:bg_cyan})

call s:hi('Tooltip', {'fg': s:fg, 'bg': s:bg_cyan})

"------------------------------------------------------------------------------
"}}}

"{{{ Common Hightlighting Group
"------------------------------------------------------------------------------
" Based on 'group-name' tag section of 'syntax.txt'
" For more information, check by `:help syntax`

call s:hi('Comment', {'fg': s:fg_gray, 'attr': 'italic'})

call s:hi('Constant', {'fg': s:fg_pink})
hi! link String    Constant
hi! link Character Constant
hi! link Number    Constant
hi! link Boolean   Constant
hi! link Float     Constant

call s:hi('Identifier', {'fg': s:fg_orange})
hi! link Function Identifier

call s:hi('Statement', {'fg': s:fg_green})
hi! link Conditonal Statement
hi! link Repeat     Statement
hi! link Label      Statement
hi! link Operator   Statement
hi! link Keyword    Statement
hi! link Exception  Statement

call s:hi('PreProc', {'fg': s:fg_blue})
hi! link Include   PreProc
hi! link Define    PreProc
hi! link Macro     PreProc
hi! link PreCondit PreProc

call s:hi('Type', {'fg': s:fg_orange})
hi! link StorageClass Type
hi! link Structure    Type
hi! link Typedef      Type

call s:hi('Special', {'fg': s:fg_orange})
hi! link SpecialChar    Special
hi! link Tag            Special
hi! link Delimiter      Special
hi! link SpecialComment Special
hi! link Debug          Special

call s:hi('Underlined', {'attr': 'underline'})

call s:hi('Ignore', {'fg': s:bg_pink})

call s:hi('Error', {'fg': s:white, 'bg': s:fg_orange , 'attr': 'bold'})

call s:hi('Todo', {'bg': s:bg_pink, 'attr': 'bold'})

"------------------------------------------------------------------------------
"}}}

" vim: set foldmethod=marker:
