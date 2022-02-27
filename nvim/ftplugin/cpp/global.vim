setlocal cindent
setlocal background=dark
setlocal encoding=utf-8
setlocal expandtab
setlocal fileformat=unix
setlocal foldlevel=99
setlocal foldmethod=syntax
setlocal nu
setlocal rnu
setlocal shiftround
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal textwidth=79

" Create a comment block for testing
nnoremap <leader>tt ostd::cout << "MTM <C-R>=expand("%:t")<ESC> LINE <C-R>=line('.')<ESC> "<CR><<std::endl;<ESC>
