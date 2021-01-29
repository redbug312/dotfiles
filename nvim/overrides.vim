au ColorScheme plain hi Normal       ctermfg=244
au ColorScheme plain hi Statement    ctermfg=248
au ColorScheme plain hi Comment      ctermfg=240
au ColorScheme plain hi NonText      ctermfg=238
au ColorScheme plain hi Whitespace   ctermfg=240

au ColorScheme plain hi Constant     ctermfg=107
au ColorScheme plain hi Special      ctermfg=103
au ColorScheme plain hi Title        ctermfg=110
au ColorScheme plain hi Underlined   ctermfg=103
au ColorScheme plain hi User1        ctermfg=137
au ColorScheme plain hi User2        ctermfg=067

au ColorScheme plain hi IncSearch    ctermfg=none ctermbg=none cterm=reverse
au ColorScheme plain hi Search       ctermfg=176  ctermbg=none cterm=underline
au ColorScheme plain hi Todo         ctermfg=176  ctermbg=none
au ColorScheme plain hi WildMenu     ctermfg=176  ctermbg=235

au ColorScheme plain hi! link Delimiter      Statement
au ColorScheme plain hi! link Directory      Constant
au ColorScheme plain hi! link LineNr         NonText
au ColorScheme plain hi! link Noise          Normal
au ColorScheme plain hi! link PreProc        Special
au ColorScheme plain hi! link SpecialKey     Special

" USER-INTERFACE

au ColorScheme plain hi MatchParen       ctermfg=none ctermbg=none cterm=reverse

au ColorScheme plain hi CursorLine       ctermfg=none ctermbg=234
au ColorScheme plain hi Folded           ctermfg=none ctermbg=235
au ColorScheme plain hi Visual           ctermfg=none ctermbg=237
au ColorScheme plain hi StatusLine       ctermfg=188  ctermbg=235
au ColorScheme plain hi StatusLineNC     ctermfg=235  ctermbg=235

au ColorScheme plain hi ErrorMsg         ctermfg=167
au ColorScheme plain hi WarningMsg       ctermfg=173

au ColorScheme plain hi DiffText         ctermfg=011  cterm=underline
au ColorScheme plain hi SpellBad         ctermfg=none cterm=underline
au ColorScheme plain hi SpellCap         ctermfg=none cterm=none
au ColorScheme plain hi SpellLocal       ctermfg=none cterm=underline
au ColorScheme plain hi SpellRare        ctermfg=none cterm=underline

au ColorScheme plain hi! link ColorColumn    CursorLine
au ColorScheme plain hi! link CursorLineNr   Normal
au ColorScheme plain hi! link Pmenu          StatusLine
au ColorScheme plain hi! link PmenuSel       WildMenu
au ColorScheme plain hi! link VertSplit      NonText

" PLUGIN-SPECIFIC

au ColorScheme plain hi! link ALEErrorSign               ErrorMsg
au ColorScheme plain hi! link ALEWarningSign             WarningMsg

au ColorScheme plain hi! link GitGutterAdd               Normal
au ColorScheme plain hi! link GitGutterChange            Normal
au ColorScheme plain hi! link GitGutterChangeDelete      Normal
au ColorScheme plain hi! link GitGutterDelete            Normal

au ColorScheme plain hi! link NERDTreeBookmark           LineNr
au ColorScheme plain hi! link NERDTreeBookmarksHeader    LineNr
au ColorScheme plain hi! link NERDTreeBookmarksLeader    LineNr
au ColorScheme plain hi! link NERDTreeFlags              Comment
au ColorScheme plain hi! link NERDTreeGitStatusClean     Comment
au ColorScheme plain hi! link NERDTreeGitStatusDirty     Comment
au ColorScheme plain hi! link NERDTreeGitStatusIgnored   Comment
au ColorScheme plain hi! link NERDTreeGitStatusModified  Comment
au ColorScheme plain hi! link NERDTreeGitStatusRenamed   Comment
au ColorScheme plain hi! link NERDTreeGitStatusStaged    Comment
au ColorScheme plain hi! link NERDTreeGitStatusUnmerged  Comment
au ColorScheme plain hi! link NERDTreeGitStatusUntracked Comment
au ColorScheme plain hi! link NERDTreeLinkDir            Directory
au ColorScheme plain hi! link NERDTreeUp                 Normal
au ColorScheme plain hi! link NERDTreeHelp               Comment

au ColorScheme plain hi! link TagbarFoldIcon             Statement
au ColorScheme plain hi! link TagbarSignature            Comment
au ColorScheme plain hi! link TagbarScope                Normal
au ColorScheme plain hi! link TagbarHighlight            Title
au ColorScheme plain hi! link TagbarType                 Statement

au ColorScheme plain hi! link SignatureMarkText          Todo
au ColorScheme plain hi! link SignatureMarkerText        Todo
