if exists("b:current_syntax")
    finish
endif

" Keywords
syntax keyword key let in

" Functions
syntax keyword func add1 sub1

highlight link key Keyword
highlight link func Function

let b:current_syntax = "adder"
