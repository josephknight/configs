let g:airline#themes#jk_airline#palette = {}

let g:airline#themes#jk_airline#palette.accents = {
      \ 'red': [ '#deadbf' , '' , 015 , 003 , '' ],
      \ }

" NORMAL ==================================== 
let s:N1 = [ '#deadbf', '#000000', 000, 007 ]
let s:N2 = [ '#deadbf', '#003f3f', 000, 008 ]
let s:N3 = [ '#deadbf', '#000000', 008, 000 ]
let g:airline#themes#jk_airline#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#jk_airline#palette.normal_modified = {
      \ 'airline_c': [ '#deadbf', '#450000', 001, '', ''] ,
      \ }

" INSERT ==================================== 
let s:I1 = [ '#deadbf', '#789f00', 000, 09 ]
" let s:I2 = [ '#deadbf', '#003f3f', 000, 008 ]
" let s:I3 = [ '#deadbf', '#000000', 008, 000 ]
let g:airline#themes#jk_airline#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#jk_airline#palette.insert_modified = g:airline#themes#jk_airline#palette.normal_modified
let g:airline#themes#jk_airline#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0], '#789f00', 000, 004, ''] ,
      \ }

" REPLACE  ==================================== 
let s:R1 = [ '#deadbf', '#789f00', 000, 14 ]
" let g:airline#themes#jk_airline#palette.replace = copy(g:airline#themes#jk_airline#palette.insert)
let g:airline#themes#jk_airline#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
" let g:airline#themes#jk_airline#palette.replace.airline_a = [ s:I2[0]   , '#920000' , s:I2[2] , 88     , ''     ]
let g:airline#themes#jk_airline#palette.replace_modified = g:airline#themes#jk_airline#palette.normal_modified
 
" VISUAL  ==================================== 
let s:V1 = ['#ffff9a', '#ff8036', 000, 003]
let s:V2 = ['#deadbf', '#003f3f', 000, 008]
let s:V3 = ['#deadbf', '#000000', 010, 000]
let g:airline#themes#jk_airline#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#jk_airline#palette.visual_modified = g:airline#themes#jk_airline#palette.normal_modified

" INACTIVE  ==================================== 
let s:IA = ['#4e4e4e', '#deadbf', 008, 000, '']
let s:IB = ['#4e4e4e', '#deadbf', 000, 008, '']
let g:airline#themes#jk_airline#palette.inactive = airline#themes#generate_color_map(s:IA, s:IB, s:IA)
let g:airline#themes#jk_airline#palette.inactive_modified = g:airline#themes#jk_airline#palette.normal_modified

" TABLINE  ==================================== 
let g:airline#themes#jk_airline#palette.tabline = {
      \ 'airline_tab':  ['#2aa198', '#003f3f', 231, 29, ''],
      \ 'airline_tabsel':  ['#deadbf', '#2e8b57', 231, 36, ''],
      \ 'airline_tabtype':  ['#deadbf', '#005252', 231, 36, ''],
      \ 'airline_tabfill':  ['#deadbf', '#000000', 231, 23, ''],
      \ 'airline_tabmod':  ['#deadbf', '#780000', 008, 005, ''],
      \ }

" WARNING  ==================================== 
let s:WI = [ '#deadbf', '#5f0000', 000, 006]
let g:airline#themes#jk_airline#palette.normal.airline_warning = [
     \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
     \ ]
let g:airline#themes#jk_airline#palette.normal_modified.airline_warning =
    \ g:airline#themes#jk_airline#palette.normal.airline_warning

let g:airline#themes#jk_airline#palette.insert.airline_warning =
    \ g:airline#themes#jk_airline#palette.normal.airline_warning

let g:airline#themes#jk_airline#palette.insert_modified.airline_warning =
    \ g:airline#themes#jk_airline#palette.normal.airline_warning

let g:airline#themes#jk_airline#palette.visual.airline_warning =
    \ g:airline#themes#jk_airline#palette.normal.airline_warning

let g:airline#themes#jk_airline#palette.visual_modified.airline_warning =
    \ g:airline#themes#jk_airline#palette.normal.airline_warning

let g:airline#themes#jk_airline#palette.replace.airline_warning =
    \ g:airline#themes#jk_airline#palette.normal.airline_warning

let g:airline#themes#jk_airline#palette.replace_modified.airline_warning =
    \ g:airline#themes#jk_airline#palette.normal.airline_warning


if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#jk_airline#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#deadbf' , '#000000' , 231 , 23 , ''     ] ,
      \ [ '#deadbf' , '#005252' , 231 , 36 , ''     ] ,
      \ [ '#deadbf' , '#973d45' , 231 , 95 , ''     ] )

