" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Save file evil mode like
let g:which_key_map.f = { 
    \'name' : '+file' ,
    \ 'f' : [':Files'    , 'Files in project'],
    \ 'l' : [':Lines'    , 'Lines in Project'],
    \}

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

" Single mappings
let g:which_key_map['c'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'horizontal split']
let g:which_key_map['r'] = [ ':RangerCurrentFile'         , 'ranger' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['F'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'vertical split']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 's' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 'L' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'g' : [':FloatermNew lazygit'        , 'lazygit'],
      \ 'a' : [':Git add .'                  , 'add all'],
      \ 'c' : [':Git commit'                 , 'commit changes'],
      \ 'j' : ['<Plug>(signify-next-hunk)'   , 'next hunk'],
      \ 'k' : ['<Plug>(signify-prev-hunk)'   , 'next hunk'],
      \ 'P' : [':Git pull'                   , 'Pull'],
      \ 'D' : [':Git diff'                   , 'Diff'],
      \ 'B' : ['GBrowse'                     , 'Browse for File'],
      \ 'p' : [':Git push'                   , 'Push'],
      \ }

" e is for explorer
let g:which_key_map.e = {
      \ 'name' : '+explorer/exec' ,
      \ 'e' : [':CocCommand explorer'                   , 'open explorer'],
      \ 'f' : [':CocCommand explorer --present floating', 'explorer floating']
      \ }

" C is for Coc hehe
let g:which_key_map.C = {
            \ 'name' : "+Coc commands" ,
            \ 'a' : [':CocList diagnostics'         , 'diagnostics'],
            \ 'e' : [':CocList extensions'          , 'extensions'],
            \ 'c' : [':CocList commands'            , 'commands'],
            \ 'f' : [':<Plug>(coc-format-selected)' , 'format'],
            \ 'o' : [':CocList outline'             , 'outline'],
            \ 's' : [':CocList -I symbols'          , 'symbols'],
            \ 'j' : [':CocNext'                     , 'Next'],
            \ 'k' : [':CocPrev'                     , 'Prev'],
            \ 'r' : [':<Plug>(coc-rename)'          , 'rename'],
            \ 'p' : [':CocListResume'               , 'List Resume'],
            \ 'A' : [':<Plug>(coc-codeaction)'      , 'rename'],
            \ 'Q' : [':<Plug>(coc-fix-current)'     , 'rename'],
            \ }

let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=float --height=6 --position=bottom' , 'popup'],
      \ 'f' : [':FloatermNew fzf'     , 'fzf'],
      \ 'p' : [':FloatermNew python'  , 'python'],
      \ 't' : [':FloatermNew'         , 'toggle'],
      \ 'h' : [':FloatermNew htop'    , 'ytop'],
      \ }
"
"" Register which key map
call which_key#register('<Space>', "g:which_key_map")
