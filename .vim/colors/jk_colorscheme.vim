" JK Colorscheme for Vim
set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "jk_colorscheme"

hi Normal		ctermfg=none		ctermbg=none		cterm=none
hi Cursor		ctermfg=darkmagenta	ctermbg=magenta		cterm=none
hi Visual		ctermfg=none		ctermbg=08		 	cterm=none
hi VisualNOS	ctermfg=none		ctermbg=08	  	 	cterm=none
hi Search		ctermfg=000			ctermbg=03  	 	cterm=none
hi Folded		ctermfg=08			ctermbg=black 	 	cterm=none
hi Title		ctermfg=white		ctermbg=black 	 	cterm=bold
hi VertSplit	ctermfg=08			ctermbg=black 	 	cterm=none
hi StatusLine	ctermfg=08			ctermbg=black 	 	cterm=none
hi StatusLineNC	ctermfg=08			ctermbg=lightgray	cterm=none
hi LineNr		ctermfg=08			ctermbg=black		cterm=none
hi SpecialKey	ctermfg=none		ctermbg=black		cterm=none
hi NonText		ctermfg=08			ctermbg=none		cterm=none
hi WarningMsg	ctermfg=darkred		ctermbg=none		cterm=none
hi ErrorMsg		ctermfg=darkred		ctermbg=none		cterm=bold

" Vim >= 7.0 specific colors
if version >= 700
	hi CursorLine	ctermfg=none	ctermbg=none	cterm=none
	autocmd InsertEnter * highlight CursorLine ctermfg=none ctermbg=black cterm=none
	autocmd InsertLeave * highlight CursorLine ctermfg=none ctermbg=none cterm=none
	"{{
	"}}
	hi MatchParen	ctermfg=white	ctermbg=none	cterm=bold
	" Popup menu
	hi Pmenu		ctermfg=08		ctermbg=black				  
	hi PmenuSel		ctermfg=black	ctermbg=08
endif

" Syntax highlighting
hi Statement	ctermfg=none	 	ctermbg=none		cterm=none
hi Conditional	ctermfg=lightgray	ctermbg=none		cterm=none
hi Repeat		ctermfg=lightgray 	ctermbg=none		cterm=none
hi Label		ctermfg=white		ctermbg=none		cterm=none
hi Operator		ctermfg=lightgray	ctermbg=none		cterm=none
hi Keyword		ctermfg=lightgray	ctermbg=none		cterm=none
hi Exception	ctermfg=none		ctermbg=darkred		cterm=none

hi Constant		ctermfg=yellow	 	ctermbg=none		cterm=none
hi String		ctermfg=03		 	ctermbg=none		cterm=none
hi Character	ctermfg=03		 	ctermbg=none		cterm=none
hi Boolean		ctermfg=darkblue 	ctermbg=none		cterm=none
hi Number		ctermfg=03			ctermbg=none		cterm=none

hi Function		ctermfg=red			ctermbg=none		cterm=none
hi Identifier	ctermfg=darkcyan 	ctermbg=none		cterm=none
hi Type			ctermfg=darkblue 	ctermbg=none		cterm=none
hi Comment		ctermfg=darkgreen 	ctermbg=none		cterm=italic
hi Todo			ctermfg=08		 	ctermbg=03			cterm=none

hi PreProc		ctermfg=03			ctermbg=none		cterm=none
" hi Include	ctermfg=03			ctermbg=none		cterm=none
" hi Define		ctermfg=03			ctermbg=none		cterm=none
" hi Macro		ctermfg=03			ctermbg=none		cterm=none
" hi PreCondit	ctermfg=03			ctermbg=none		cterm=none

hi Special		ctermfg=darkmagenta	ctermbg=none		cterm=none

" Diff highlighting
hi DiffAdd							ctermbg=17				  
hi DiffDelete	ctermfg=234			ctermbg=60		cterm=none
hi DiffText							ctermbg=53		cterm=none
hi DiffChange						ctermbg=237				  

"hi CursorIM
"hi Directory
"hi IncSearch
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuSbar
"hi PmenuThumb
"hi Question
"hi Scrollbar

" col containing lint indicators
hi SignColumn ctermbg=none 

"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
hi TabLine		ctermfg=08			ctermbg=black		cterm=none
hi TabLineFill	ctermfg=08			ctermbg=black		cterm=none
hi TabLineSel	ctermfg=none		ctermbg=none		cterm=none
"hi Tooltip
"hi User1
"hi User9
"hi WildMenu

" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine
" hi! link NonText		LineNr

" vim:set ts=4 sw=4 noet:

" pymode coloration
" hi 
