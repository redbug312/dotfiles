" =============================================================================
" Filename: road.vim
" Author: RedBug312
" License: MIT License
" Last Change: 2018/01/19
" The file should be placed under `plugged/lightline.vim/autoload/lightline/colorscheme/`
" =============================================================================
let s:base   = ['#262626', 235]
let s:gray   = ['#5f5f5f',  59]
let s:white  = ['#d7d7d7', 249]
let s:yellow = ['#ffd75f', 221]
let s:red    = ['#af5f5f', 167]
let s:blue   = ['#5f5fff',  75]
let s:green  = ['#5faf87',  77]
let s:orange = ['#ffaf5f', 209]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [[s:white,  s:base], [s:white, s:base]]
let s:p.normal.right    = [[s:white,  s:base], [s:white, s:base]]
let s:p.inactive.left   = [[s:gray,   s:base], [s:gray,  s:base]]
let s:p.inactive.right  = [[s:gray,   s:base], [s:gray,  s:base]]
let s:p.insert.left     = [[s:green,  s:base], [s:white, s:base]]
let s:p.insert.right    = [[s:white,  s:base], [s:white, s:base]]
let s:p.replace.left    = [[s:red,    s:base], [s:white, s:base]]
let s:p.visual.left     = [[s:blue,   s:base], [s:white, s:base]]
let s:p.normal.middle   = [[s:white,  s:base]]
let s:p.inactive.middle = [[s:gray,   s:base]]
let s:p.normal.error    = [[s:red   , s:base]]
let s:p.normal.warning  = [[s:orange, s:base]]

let g:lightline#colorscheme#road#palette = lightline#colorscheme#flatten(s:p)
