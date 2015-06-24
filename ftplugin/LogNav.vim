" Vim filetype plugin file
" Maintainer: Marcelo Montu <https://github.com/mMontu/vim-LogNav>

if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Using line continuation here.
let s:cpo_save = &cpo
set cpo-=C


if exists ('b:lognav_dialog_start')
  nnoremap <buffer> <silent> J :call LogNav#DialogStart('')<CR>
  nnoremap <buffer> <silent> K :call LogNav#DialogStart('b')<CR>
  nnoremap <buffer> <silent> L :call LogNav#LastDialogStart()<CR>
endif


let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=2 sts=0 sw=2 expandtab :
