" GENERAL SETTINGS
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






set expandtab                                   " 
set foldlevel=99                                " 
set foldmethod=manual                           " 
set nu                                          " 
set rnu                                         " 
set shiftwidth=2                                " 
set softtabstop=2                               " 
set tabstop=2                                   " 

color elflord                                   " Sets the color scheme
set background=dark                             " Sets the colorscheme to dark-mode

set incsearch                                   " Do incremental searching to timeout

set backup                                      " Keep a backup file (restore to previous version)
set undofile                                    " Keep an undo file (undo changes after closing)
