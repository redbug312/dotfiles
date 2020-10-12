let mapleader = "\<Space>"

" SHORTCUTS
nnoremap <F3>  :let @+ = expand('%:p')<CR>:echo 'Copied: '.expand('%:p')<CR>
nnoremap <F4>  :execute "!git blame -L".min([line('$')-8,max([line('.')-4,1])]).",+9 %"<CR>
nnoremap <F5>  :wa<CR>:make build FILE=%<CR>
nnoremap <F6>  :wa<CR>:make start FILE=%<CR>
nnoremap <F7>  :wa<CR>:make debug FILE=%<CR>
nnoremap <F8>  :wa<CR>:make test  FILE=%<CR>
nnoremap <F9>  :vsplit term://fish<CR>A
nmap     <F10> <Plug>(GitGutterPreviewHunk)

" REPLACEMENTS
noremap  ^ 0
noremap  0 ^
noremap  - $
vnoremap u <NOP>
vnoremap / <Esc>/\%V
nnoremap Q <NOP>
nnoremap Y y$
nnoremap K i<CR><Esc>k$
nnoremap <C-c> <C-a>
inoremap <C-w> <C-\><C-O>dB
inoremap <C-h> <C-\><C-O>db

" VIEWING (LEADER)
nnoremap <Leader>a  :FSSplitRight<CR>
nnoremap <Leader>c  :call<SID>PrintSynStack()<CR>
nnoremap <Leader>h  :NERDTreeToggle<CR>
nnoremap <Leader>j  :cclose\|pclose\|lclose<CR>
nnoremap <Leader>k  :buffers<CR>
nnoremap <Leader>l  :TagbarToggle<CR>
nmap     <Leader>gs <Plug>(GitGutterStageHunk)
nmap     <Leader>gu <Plug>(GitGutterUndoHunk)

" OPTIONS (LEADER-O)
nnoremap <Leader>ob :set<Space>linebreak!<CR>
nnoremap <Leader>oc :call<SID>ToggleColorColumn()<CR>
nnoremap <Leader>oh :let<Space>@/="⚑"<CR>
nnoremap <Leader>op :set<Space>paste!<CR>
nnoremap <Leader>or :set<Space>relativenumber!<CR>
nnoremap <Leader>os :set<Space>spell!<CR>
nnoremap <Leader>ov :set<Space>virtualedit!<CR>
nnoremap <Leader>ow :set<Space>wrap!<CR>
nmap     <Leader>ol <Plug>(ale_toggle_buffer)

" LIST-JUMPING
nmap     [l <Plug>(ale_previous_wrap)zz
nmap     ]l <Plug>(ale_next_wrap)zz
nmap     [g <Plug>(GitGutterPrevHunk)zz
nmap     ]g <Plug>(GitGutterNextHunk)zz
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [t :tprev<CR>
nnoremap ]t :tnext<CR>

" TEXT-OBJECTS-MOTIONS (G)
nmap     ga <Plug>(EasyAlign)
vmap     ga <Plug>(EasyAlign)
nnoremap g- :%s`\s\+$``e<CR>``

" NAVIGATING
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap <C-h> <gv
vnoremap <C-j> xp`[V`]
vnoremap <C-k> xkP`[V`]
vnoremap <C-l> >gv

" CMDLINE-MODE
cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-_> <CR>:%s`<C-r>/``gc<LEFT><LEFT><LEFT>
cnoremap <C-c> <Esc>

" INSERT-MODE (COMMA)
nnoremap ,, <Esc>:let<Space>@/="⚑"<CR>ncl
vnoremap ,, <Esc>:let<Space>@/="⚑"<CR>ncl
inoremap ,, <Esc>:let<Space>@/="⚑"<CR>ncl

inoremap ,*    <C-g>u<Esc>[s1z=`]a<C-g>u
inoremap ,"    <C-r>
inoremap ,flag ⚑

inoremap ,[ <Left>
inoremap ,] <Right>
inoremap ,< <C-d>
inoremap ,> <C-t>

autocmd Filetype markdown inoremap ,b   <C-g>u****⚑<Esc>F*hi<C-g>u
autocmd Filetype markdown inoremap ,m   <C-g>u$$⚑<Esc>F$i<C-g>u
autocmd Filetype markdown inoremap ,i   <C-g>u<i></i>⚑<Esc>2T>i<C-g>u
autocmd Filetype markdown inoremap ,a   <C-g>u[](⚑)⚑<Esc>F[a<C-g>u
autocmd Filetype markdown inoremap ,sub <C-g>u<sub></sub>⚑<Esc>2T>i<C-g>u
autocmd Filetype markdown inoremap ,sup <C-g>u<sup></sup>⚑<Esc>2T>i<C-g>u
autocmd Filetype markdown inoremap ,env <C-g>u\begin{}⚑\end{⚑}⚑<Esc>2F}i<C-g>u
autocmd Filetype markdown inoremap ,def <C-g>u<dl><CR><dt></dt><CR><dd>⚑</dd><CR></dl><Esc>2kf>a<C-g>u
autocmd Filetype markdown inoremap ,det <C-g>u<details><CR><summary></summary><CR>⚑<CR></details><Esc>2kf>a<C-g>u

autocmd Filetype rust       inoremap ,print <C-g>uprintln!("{:?}", );⚑<Esc>F)i<C-g>u
autocmd Filetype javascript inoremap ,print <C-g>uconsole.log();⚑<Esc>F)i<C-g>u

" SCRIPTS
function! s:PrintSynStack()
    if !exists("*synstack")
        return
    endif
    let l:synstack = synstack(line('.'), col('.'))
    let l:synid = synID(line('.'), col('.'), 1)
    let l:targetsynid = synIDtrans(l:synid)
    echo map(l:synstack, 'synIDattr(v:val, "name")')
    if l:synid != ''
        exec 'hi '.synIDattr(l:synid, 'name')
    endif
    if l:targetsynid != ''
        exec 'hi '.synIDattr(l:targetsynid, 'name')
    endif
endfunc

function! s:ToggleColorColumn()
    if !exists("&colorcolumn")
        return
    endif
    if &colorcolumn == ''
        set colorcolumn=80,81
    else
        set colorcolumn=
    endif
endfunc

function! s:ToggleSignColumn()
    if !exists("&signcolumn")
        return
    endif
    if &signcolumn == 'no'
        set signcolumn=auto
    else
        set signcolumn=no
    endif
endfunc
