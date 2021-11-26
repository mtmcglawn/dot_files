if empty($XDG_CONFIG_HOME) | let $XDG_CONFIG_HOME = $HOME."/.config" | endif
if empty($XDG_CACHE_HOME) | let $XDG_CACHE_HOME = $XDG_CONFIG_HOME."/.cache" | endif
if empty($XDG_DATA_HOME) | let $XDG_DATA_HOME = $XDG_CONFIG_HOME."/.share" | endif

if has("nvim") " Neovim was called, not vim.
  let $MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
else
  let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
endif
so $MYVIMRC
