if exists("b:current_syntax")
    finish
endif

" Keywords
syntax keyword key let in if else true false def

" Functions
syntax keyword func add1 sub1

" Operators
syntax match op "\v\+"
syntax match op "\v\-"
syntax match op "\v\*"
syntax match op "\v\/"
syntax match op "\v\>"
syntax match op "\v\<"
syntax match op "\v\>="
syntax match op "\v\<="
syntax match op "\v\||"
syntax match op "\v\&&"
syntax match op "\v\=="
syntax match op "\v\!"

highlight link key Keyword
highlight link func Function
highlight link op Operator

let b:current_syntax = "diamondback"
