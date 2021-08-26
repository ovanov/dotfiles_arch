let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/.config/qtile/config.py' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'w': '~/.config/nvim/keys/which-key.vim' },
            \ { 'p': '~/.config/nvim/vim-plug/plugins.vim' },
            \ { 'al': '~/.config/alacritty/alacritty.yml' },
            \ { 'uni' : '~/Tresors/organic/Uni'},
            \ '~/Tresors/privat/Bilder',
            \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_fortune_use_unicode = 1


let g:startify_custom_header = [
        \ '     ___           ___           ___           ___           ___     ',
        \ '    /  /\         /__/\         /  /\         /  /\         /  /\    ',
        \ '   /  /:/_       |  |::\       /  /::\       /  /:/        /  /:/_   ',
        \ '  /  /:/ /\      |  |:|:\     /  /:/\:\     /  /:/        /  /:/ /\  ',
        \ ' /  /:/ /:/_   __|__|:|\:\   /  /:/~/::\   /  /:/  ___   /  /:/ /::\ ',
        \ '/__/:/ /:/ /\ /__/::::| \:\ /__/:/ /:/\:\ /__/:/  /  /\ /__/:/ /:/\:\',
        \ '\  \:\/:/ /:/ \  \:\~~\__\/ \  \:\/:/__\/ \  \:\ /  /:/ \  \:\/:/~/:/',
        \ ' \  \::/ /:/   \  \:\        \  \::/       \  \:\  /:/   \  \::/ /:/ ',
        \ '  \  \:\/:/     \  \:\        \  \:\        \  \:\/:/     \__\/ /:/  ',
        \ '   \  \::/       \  \:\        \  \:\        \  \::/        /__/:/   ',
        \ '    \__\/         \__\/         \__\/         \__\/         \__\/    ',
        \]

lua << EOF
function _G.webDevIcons(path)
  local filename = vim.fn.fnamemodify(path, ':t')
  local extension = vim.fn.fnamemodify(path, ':e')
  return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end
EOF

function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction
