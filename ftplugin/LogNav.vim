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


if !hasmapto('<Plug>LogNavNextDialog')
   nmap <buffer> J <Plug>LogNavNextDialog
endif
if !hasmapto('<Plug>LogNavPrevDialog')
   nmap <buffer> K <Plug>LogNavPrevDialog
endif
if !hasmapto('<Plug>LogNavLastDialog')
   nmap <buffer> L <Plug>LogNavLastDialog
endif


let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=2 sts=0 sw=2 expandtab :
