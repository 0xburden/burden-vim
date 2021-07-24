![Terminal running neovim with this configuration](https://github.com/0xburden/burden-vim/images/burden-vim.gif)
# (N)VIM
_the 0xburden way_

### What the fuck does that mean?
* Sensible defaults (isolated non-plugin version included)
* Fuzzy finding
* JS Frontend goodies
* Elixir and solidity syntax support, because fuck it
* Terminal and buffer splitting shortcuts
* File explorer shortcuts
* Street cred

### How to do ??
Config assumes [vim-plug](https://github.com/junegunn/vim-plug) for plugin management. Install vim-plug, place config in appropriate dir, fire up (N)VIM and run `:PlugInstall`

If using non-plugin version just place in approrpriate dir

### Plugins
Duh.

This setup isn't too heavy on deps but there is still a few

### Fuzzy find necessities
the packages `fzy`, `ripgrep` and `the_silver_searcher` will need to be installed or built for fuzzy find to work right

### JS necessities
You'll need `nodejs`, `npm` and `prettier`, the rest should be pulled in on install
