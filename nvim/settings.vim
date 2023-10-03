" GENERAL SETTINGS

" Enable file type detection
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" revert with ":filetype off".
filetype plugin indent on

":fixdel                                        " If <DELETE> is messed up, this will fix it
set autoindent                                  " Copy indent from current line when starting a new line
set backspace=indent,eol,start                  " Allows backspacing over everything in insert mode
set cmdheight=1                                 " Number of screen lines to use for the comand line
set diffopt+=filler,vertical                    " Option settings for diff mode
"set display=truncate                            " Show @@@ in the last line if it is truncated
set encoding=utf-8                              " Set encoding
"set equalalways                                 " When on, all the windows are automatically made the same size after splitting or closing a window
set foldenable                                  " Auto fold code
set history=1000                                " Keep 1000 lines of code
set ignorecase                                  " Case insensitive search
set laststatus=2                                " Always show the status line at the bottom of the screen
set linespace=2                                 " No extra spaces between rows
set magic                                       " Changes the special characters that can be used in search patterns
set modeline                                    " Allows for settings to be read from source code
set mouse=a                                     " Allows for mouse control
set nowrap                                      " Prevent the line from wrapping around to the line below
set nrformats-=octals                           " Do not recognize octal numbers for <CTRL-A> and <CTRL-X>
set ruler                                       " Show the cursor position all the time
set scrolljump=1                                " Lines to scroll when cursor leaves the screen
set scrolloff=5                                 " Show a few lines of context around the cursor.   NOTE: This makes the text scroll if you mouse-click
set shellslash                                  " Set forward slash used when expanding file names
set showcmd                                     " Display incomplete commands
set showfulltag                                 " When completing a word in insert mode from the tags file, show both the tag name and a tidied-up form of the search pattern as possible matches
set showmode                                    " If in insert, replace, or visual mode put a message on the last line.
set smartcase                                   " Case sensitive when U(pper)C(ase) present
set smartindent                                 " Do smart autoindenting when starting a new line
set smarttab                                    " When on a <TAB> in front of a line inserts blanks according to 'shiftwidth'
set splitbelow                                  " Sets the location of new windows
set splitright                                  " Sets the location of new windows
"set tags=+                                      " Add global location for all tags
set ttimeout                                    " Time out for key codes
set ttimeoutlen=100                             " Wait up to 100ms after <ESC> for special key
set undolevels=1000                             " Maximum number of changes that can be undone
set wildignore=*.o,*.~,*.pyc                    " A list of file patterns to ignore when expanding wildcards
set wildmenu                                    " Display completion matchesin a status line
set wildmode=longest:full,full                  " When auto-complete in command mode, list all possibilities, then cycle
set wrapscan                                    " Searches wrap around the file
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility

set incsearch                                   " Do incremental searching to timeout

set backup                                      " Keep a backup file (restore to previous version)
set undofile                                    " Keep an undo file (undo changes after closing)

" Put these in an autocmd group, so that you can rever them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
  au!

  " When editing a file, always jumb to the last known cursur position. Don't
  " do it when the position is invalid, when inside an event handler (happens
  " when dropping a file on gvim) and for a commit message (it's likely a
  " different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ | exe "normal! g`\""
    \ | endif

augroup END






"COLOR OPTIONS
color elflord                                   " Sets the color scheme
set background=dark                             " Sets the colorscheme to dark-mode

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red





"GUI OPTIONS
set background=dark                             " Sets the colorscheme to dark-mode
"set columns=999                                 " Number of columns to start with in gvim
"set rows=999                                    " Number of rows to start with in gvim

" make the gui look like the terminal
"set guioptions-=m                               " Remote the menu
"set guioptions-=T                               " Remote the toolbar
"set guioptions-=r                               " Remote the right scrollbar
"set guioptions-=l                               " Remote the left scrollbar
"set guioptions-=L                               " Remote the left scrollbar when there is a vertical split
"set guioptions-=e                               " Set the tabs as similar to CLI
"set guioptions+=b                               " Set the bottom scrollbar






" SESSION OPTIONS
set sessionoptions+=resize                      " Keep the window size in a session
set sessionoptions+=winpos                      " Keep the windo position (GUI only)






"FUNCTIONS

" This Function displays the current buffer with a locked header that scrolls
" horizontally but not vertically
" This is good for output files that are wide or really long so the header is
" always visible
function! LockheaderRow()
  set nowrap
  exe "aboveleft 1spl"
  set scrollbind
  exe "normal gg"
  exe "normal \<C-W>\<C-W>"
  set scrollbind
  set sbo=hor
endfunction
command! LH call LockHeaderRow()

" This function will toggle if whitespace is checked during a diff
" Default is to include whitespace diffs
function! IgnoreWhiteSpaceDiffsToggle()
  if &diff
    if &diffopt =~ 'iwhite'
      set diffopt-=iwhite
    else
      set diffopt+=iwhite
    endif
  endif
endfunction
command! IWSDT call IgnoreWhiteSpaceDiffToggle()
nnoremap <silent> <leader>iw :IWSDT<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif






" SPELLING

augroup spellfiles
  autocmd!
  " per git repo or file spellfile
  "let &l:git_path = system('type git')
  "silent! !type git
  let git_type = system('type git')
  if v:shell_error == 0
    let git_path = trim(system('which git'))
    lcd %:p:h
    let is_git_repo = trim(system(git_path . ' rev-parse --is-inside-work-tree'))
    lcd -
    if is_git_repo == 'true'
      let git_repo = trim(system(git_path . ' rev-parse --show-toplevel'))
      autocmd BufNewFile,BufRead * let &l:spellfile .= git_repo . '/.' . 'local.en.utf-8.add'
    else
      autocmd BufNewFile,BufRead * let &l:spellfile .= expand('%:p:h') . '/.' . 'local.en.utf-8.add'
    endif
  else
    autocmd BufNewFile,BufRead * let &l:spellfile .= expand('%:p:h') . '/.' . 'local.en.utf-8.add'
  endif
  " per filetype spellfile
  if &ft == 'markdown'
    autocmd BufNewFile,BufRead * let &l:spellfile .= ',' . expand($XDG_CONFIG_HOME) . expand('/nvim/spell/', 'p:h') . &ft . 'markdown.en.utf-8.add'
  else
    autocmd BufNewFile,BufRead * let &l:spellfile .= ',' . expand($XDG_CONFIG_HOME) . expand('/nvim/spell/', 'p:h') . &ft . '/' . 'en.utf-8.add'
  endif
  " per global spellfile (FileType autocmd seems to fire before BufNewFile)
  autocmd BufNewFile,BufRead * let &l:spellfile .= ',' . expand($XDG_CONFIG_HOME) . expand('/nvim/spell/', 'p:h') . 'en.utf-8.add'
augroup END





" Filetypes

augroup filetypedetect
  " Use 'setfiletype foo' to only override if filetype is not already found
  " Use 'set filetype=foo' to override filetype regardless
  " 
  " HLA FOM types
  au BufNewFile,BufRead *.fed set filetype=lisp
  au BufNewFile,BufRead *.omt set filetype=lisp
  au BufNewFile,BufRead *.omd set filetype=lisp
  "
  " Jenkinsfile
  au BufNewFile,BufRead Jenkinsfile set filetype=groovy
augroup END





" PATH

" Where to look for 'find' and 'gf'
augroup path_settings
  autocmd!
  " Set normal paths
  let s:local_path='.,../include,../src'
  " Set other paths
  "let s:other='/abs/path/to/**'
  "let s:other_other='/abs/path/to/other/**'
  exec "set path=".s:local_path
  "if expand('%:p') =~ '/abs/path/to/*'
  "  exec "set path+=".s:other
  "elseif expand('%:p') =~ '/abs/path/to/other/*'
  "  exec "set path+=".s:other_other
  "endif
augroup END





" NETRW Global settings
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_banner=0






" PACKAGES
" Add optional packages.

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The '!' means the package won't be loaded right away but when plugins are
" loaded during initialization.
"if has('syntax') && has('eval')
"  packadd! matchit
"endif





" CSCOPE

" Look into cscope






" POSSIBLE PLUGINS
" autopairs
" fugitive
" gitgutter
" lightline
" mundo
" nerdcommenter
" rainbow
" solarized
" surround
" tagbar

let g:general_mapping_file = expand($XDG_CONFIG_HOME) . '/nvim/mappings/global.vim'
execute 'source '.general_mapping_file
