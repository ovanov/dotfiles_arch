"    ____     _ __        _     
"   /  _/__  (_) /_ _  __(_)_ _ 
"  _/ // _ \/ / __/| |/ / /  ' \
" /___/_//_/_/\__(_)___/_/_/_/_/
                              

"" ... General Conf ...

"  Plugins and Settings / Start screen
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/plug-config/start-screen.vim



"" ... Color and Theme ...

" Statusline
source $HOME/.config/nvim/themes/airline.vim
" Wal
source $HOME/.config/nvim/colors/wal.vim
" Icons
luafile $HOME/.config/nvim/lua/plugins/nvim-devicons.lua



"" ... Utility ...
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/ranger.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
" FZF
source $HOME/.config/nvim/plug-config/fzf.vim



"" ... Keymaps and ... 
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/sneak.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
" Which Key
source $HOME/.config/nvim/keys/which-key.vim



"" Coc setup language support
source $HOME/.config/nvim/plug-config/coc.vim



"" ... NEOVIDE conf ...
source $HOME/.config/nvim/general/nvide.vim
