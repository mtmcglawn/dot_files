setlocal spell
setlocal rnu
setlocal nu
setlocal autoindent
setlocal background=dark
setlocal encoding=utf-8
setlocal expandtab
setlocal fileformat=unix
setlocal foldlevel=99
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=0

inoremap <C-P> <C-G>u<ESC>[s1z=`]a<C-G>u

nnoremap <leader>td o# <ESC>:put =strftime('%a %d %b %Y')<CR>kJo<ESC>
nnoremap <leader>ti o## ISSUE-<CR><ESC>kA
nnoremap <leader>tt o### <ESC>:put -strftime('%r %Z')<CR>kJo<ESC>
nnoremap <leader>td o#### Update:<CR>

"autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
