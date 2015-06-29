" Vim filetype plugin file
" Maintainer: Marcelo Montu <https://github.com/mMontu/vim-LogNav>

if exists('g:loaded_lognav') || &cp || version < 700
   finish
endif
let g:loaded_lognav = 1

" Mappings {{{1
noremap <silent> <Plug>LogNavNextDialog :call LogNav#DialogStart('')<CR>
noremap <silent> <Plug>LogNavPrevDialog :call LogNav#DialogStart('b')<CR>
noremap <silent> <Plug>LogNavLastDialog :call LogNav#LastDialogStart()<CR>

" vim: ts=2 sts=0 sw=2 expandtab :