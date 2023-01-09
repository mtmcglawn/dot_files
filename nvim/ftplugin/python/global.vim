setlocal autoindent
setlocal background=dark
setlocal encoding=utf-8
setlocal expandtab
setlocal fileformat=unix
setlocal foldlevel=99
setlocal foldmethod=indent
setlocal nu
setlocal rnu
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=79

" Display tabs at the beginning of a line in Python as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhiteSpace /^\t\+/

" Make trailing whitespace be flagged as bad
au BufRead,BufNewFile *.py,*.pyw match BadWhiteSpace /\s\+$/
