hi Normal       ctermfg=244
hi Statement    ctermfg=248
hi Comment      ctermfg=240
hi NonText      ctermfg=238
hi Whitespace   ctermfg=240

hi Constant     ctermfg=107
hi Special      ctermfg=103
hi Title        ctermfg=110
hi Underlined   ctermfg=103
hi User1        ctermfg=137
hi User2        ctermfg=067

hi IncSearch    ctermfg=none ctermbg=none cterm=reverse
hi Search       ctermfg=176  ctermbg=none cterm=underline
hi Todo         ctermfg=176  ctermbg=none
hi WildMenu     ctermfg=176  ctermbg=235

hi! link Delimiter      Statement
hi! link Directory      Constant
hi! link LineNr         NonText
hi! link Noise          Normal
hi! link PreProc        Special
hi! link SpecialKey     Special

" USER-INTERFACE

hi MatchParen       ctermfg=none ctermbg=none cterm=reverse

hi CursorLine       ctermfg=none ctermbg=234
hi Folded           ctermfg=none ctermbg=235
hi Visual           ctermfg=none ctermbg=237
hi StatusLine       ctermfg=188  ctermbg=235
hi StatusLineNC     ctermfg=235  ctermbg=235

hi ErrorMsg         ctermfg=167
hi WarningMsg       ctermfg=173

hi DiffText         ctermfg=011  cterm=underline
hi SpellBad         ctermfg=none cterm=underline
hi SpellCap         ctermfg=none cterm=none
hi SpellLocal       ctermfg=none cterm=underline
hi SpellRare        ctermfg=none cterm=underline

hi! link ColorColumn    CursorLine
hi! link CursorLineNr   Normal
hi! link Pmenu          StatusLine
hi! link PmenuSel       WildMenu
hi! link VertSplit      NonText

" LANGUAGE-SPECIFIC

hi! link CSVColumnHeaderOdd Title
hi! link CSVColumnHeaderEven User2
hi! link CSVColumnOdd       Statement
hi! link CSVColumnEven      Normal
hi! link CSVDelimiter       NonText

hi! link jsRegexpCharClass  User1
hi! link jsRegexpQuantifier User1
hi! link jsFuncName         Title
hi! link jsThis             Title
hi! link jsGlobalObjects    Special
hi! link jsOperatorKeyword  Special
hi! link jsReturn           Special
hi! link jsNull             Special
hi! link jsUndefined        Constant

hi! link luaFuncName        Title

hi! link pythonFunction     Title
hi! link pythonBuiltinFunc  Statement
hi! link pythonBuiltinType  Statement

hi! link htmlBold           String
hi! link htmlItalic         String
hi! link htmlTag            Statement
hi! link htmlEndTag         Statement
hi! link htmlH1             Title
hi! link htmlH2             Title
hi! link htmlH3             Title
hi! link htmlH4             Title
hi! link htmlH5             Title
hi! link htmlH6             Title

hi! link mkdHeading         NonText
hi! link mkdBold            NonText
hi! link mkdItalic          NonText
hi! link mkdDelimiter       NonText
hi! link mkdBlockquote      Statement
hi! link mkdListItem        Statement
hi! link mkdURL             Comment
hi! link mkdLineBreak       Whitespace
" hi! link markdownInlineDelimiter  NonText
" hi! link markdownHeadingDelimiter NonText
" hi! link markdownH1         Title
" hi! link markdownH2         Title
" hi! link markdownH3         Title
" hi! link markdownH4         Title
" hi! link markdownH5         Title
" hi! link markdownH6         Title
" hi! link markdownLinkUrl    Comment
" hi! link markdownXmlComment Comment
" hi! link markdownBold       String
" hi! link markdownItalic     String

hi! link texType            User1
hi! link texMath            User1
hi! link texMathSymbol      User2
hi! link texGreek           User2
hi! link texStatement       Normal
hi! link texMathOper        texStatement
hi! link texMathText        texStatement

hi! link gitcommitSummary   Title
hi! link gitcommitHeader    Statement
hi! link gitrebaseEdit      Statement
hi! link gitrebaseExec      Statement
hi! link gitrebaseDrop      Statement

hi! link xmlTag             Normal
hi! link xmlProcessingDelim Special

hi! link poHeaderItem       Special
hi! link poStringSTR        Normal
hi! link poPuncError        Error
hi! link poHtml             Statement

hi! link dtDelim            Statement

hi! link dAttribute         Special

hi! link rOperator          Special
hi! link rType              Statement

hi! link javaOperator       Special
hi! link javaTypedef        Title

hi! link rustSelf           Special
hi! link rustFuncName       Title
hi! link rustCommentLineDoc Comment
hi! link rustIdentifier     Title
hi! link rustDeriveTrait    Statement

hi! link jsonKeyword        Normal

hi! link makeTarget         Statement
hi! link makeSpecTarget     Special

hi! link pugTag             Statement
hi! link pugClassChar       Normal
hi! link pugTagInlineText   Comment
hi! link pugPipedText       Comment
hi! link pugScriptStatement Title
hi! link pugId              Special
hi! link pugIdChar          Special

" PLUGIN-SPECIFIC

hi! link ALEErrorSign               ErrorMsg
hi! link ALEWarningSign             WarningMsg

hi! link GitGutterAdd               Normal
hi! link GitGutterChange            Normal
hi! link GitGutterChangeDelete      Normal
hi! link GitGutterDelete            Normal

hi! link NERDTreeBookmark           LineNr
hi! link NERDTreeBookmarksHeader    LineNr
hi! link NERDTreeBookmarksLeader    LineNr
hi! link NERDTreeFlags              LineNr
hi! link NERDTreeGitStatusDirClean  LineNr
hi! link NERDTreeGitStatusDirDirty  LineNr
hi! link NERDTreeGitStatusIgnored   LineNr
hi! link NERDTreeGitStatusModified  LineNr
hi! link NERDTreeGitStatusRenamed   LineNr
hi! link NERDTreeGitStatusStaged    LineNr
hi! link NERDTreeGitStatusUnmerged  LineNr
hi! link NERDTreeGitStatusUntracked LineNr
hi! link NERDTreeLinkDir            Directory
hi! link NERDTreeUp                 Normal
hi! link NERDTreeHelp               Comment

hi! link TagbarFoldIcon             Statement
hi! link TagbarSignature            Comment
hi! link TagbarScope                Normal
hi! link TagbarHighlight            Title
hi! link TagbarType                 Statement

hi! link SignatureMarkText          Todo
hi! link SignatureMarkerText        Todo
