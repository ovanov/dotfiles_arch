" do not overwrite
let g:ranger_map_keys = 0
" map new key
map <leader>r :Ranger<CR>

let g:NERDTreeHijackNetrw = 0 "" add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "" open ranger when vim open a directory
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
