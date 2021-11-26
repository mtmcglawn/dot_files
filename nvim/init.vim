" Where to look to load configs
set runtimepath^=$XDG_CONFIG_HOME/nvim
set runtimepath+=$XDG_DATA_HOME/nvim
set runtimepath+=$XDG_CONFIG_HOME/nvim/after
set runtimepath+=$XDG_DATA_HOME/nvim/after
set runtimepath+=$VIM
set runtimepath+=$VIMRUNTIME

" Where to look to load packages
set packpath^=$XDG_DATA_HOME/nvim,$XDG_CONFIG_HOME/nvim
set packpath=+$XDG_CONFIG_HOME/nvim/after,$XDG_DATA_HOME/nvim/after

" Where to look for netrw bookmarks/spellfiles/etc.
let g:netrw_home = $XDG_DATA_HOME."/nvim"
call mkdir($XDG_DATA_HOME."/nvim/spell", 'p', 0755)
set viewdir=$XDG_DATA_HOME/nvim/view | call mkdir($viewdir, 'p', 0755)

" Where to look for .bak, .swp, and undofiles
set backupdir=$XDG_CACHE_HOME/nvim/backup | call mkdir(&backupdir, 'p', 0755)
set directory=$XDG_CACHE_HOME/nvim/swap | call mkdir(&directory, 'p', 0755)
set undodir=$XDG_CACHE_HOME/nvim/undo | call mkdir(&undodir, 'p', 0755)

" Set viminfo state
set viminfo=%,<800,'10,/50,:100,h,f0,n$XDG_CACHE_HOME/nvim/viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <,vi6.2)
"           + save/restore buffer list
