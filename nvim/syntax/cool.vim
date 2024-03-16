if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" catch mismatched braces and parens ripped from c.vim and changed to let
" braces be embedded in parens
syn cluster     cParenGroup     contains=cIncluded,cSpecial,cCommentSkip,cCommentString,cComment2String,@cCommentGroup,cCommentStartError,cUserCont,cUserLabel,cBitField,cCommentSkip,cOctalZero,cCppOut,cCppOut2,cCppSkip,cFormat,cNumber,cFloat,cOctal,cOctalError,cNumbersCom
syn region	cParen		transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,cErrInBracket,cCppBracket,cCppString,@Spell
syn match	cErrInParen	display contained "}"
syn region	cBracket	transparent start='{' end='}' contains=ALLBUT,@cParenGroup,cErrInParen,cCppParen,cCppBracket,cCppString,@Spell
syn match	cErrInBracket	display contained ")"

" all lowercase words are variables or methods
syn match       Function "\<\l\w*"

"keywords are case insensitive
syn case ignore
syn keyword     Operator        isvoid not
syn keyword     Type            SELF_TYPE
syn keyword     Statement       self let in
syn keyword     Conditional     if then else fi case esac of
syn keyword     Repeat          while loop pool
syn keyword     Boolean         true false

" anything after a : is a type
syn match       Error ":\s*\S*"
syn match       Type ":\s*\u\w*"

" anything after a @ is a type
syn match       Error "@\s*\S*"
syn match       Type "@\s*\u\w*"

" anything after class is a type
syn match       Error "\<class\>\s*\S*"
syn match       Type  "\<class\>\s*\u\w*"

" anything after inherits is a type
syn match       Error "\<inherits\>\s*\S*"
syn match       Type  "\<inherits\>\s*\u\w*"

" anything after new is a type
syn match       Error "\<new\>\s*\S*"
syn match       Operator  "\<new\>\s*\u\w*"

" C style integers ripped from c.vim
syn match       cNumbers        display transparent "\<\d\|\.\d" contains=cNumber
syn match       cNumber         display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"

" C style strings ripped from c.vim
syn match       cSpecial    display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region      String  start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial,@Spell

" vhdl style comment
syn match coolComment "--.*$" contains=coolTodo

" ocmal style comment ripped from ocmal.vim
syn region   coolComment start="(\*" end="\*)" contains=coolComment,coolTodo
syn keyword  coolTodo contained TODO FIXME XXX

hi def link cSpecial            SpecialChar
hi def link cNumber             Number
hi def link coolComment         Comment
hi def link coolTodo            Todo
hi def link cErrInParen         Error
hi def link cErrInBracket       Error
