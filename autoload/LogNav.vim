" vim-LogNav: syntax highlight for generic log files
" Maintainer: Marcelo Montu <https://github.com/mMontu/vim-LogNav>

let save_cpo = &cpo   " allow line continuation
set cpo&vim

" constants {{{1
let s:PLUGIN_TAG = '[LogNav] '


function! LogNav#DialogStart(direction) " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move the cursor and highlight the line of the next/previous block/dialog
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if search(b:lognav_dialog_start, 'W'.a:direction)
    match none			" delete existing highlight
    exe 'match SpellLocal /\%' . line(".") . 'l.*/' 
  else
    echohl Question
    echomsg s:PLUGIN_TAG."no match found"
    echohl None
  endif
endfunction

function! LogNav#LastDialogStart() " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" update the log and move the cursor to the last block/dialog
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if exists('b:lognav_update_cmd')
    setlocal autoread
    exe b:lognav_update_cmd
    " refresh folds
    if (exists('b:lognav_fold_ext_msg'))
      call LogNav#EnableFold()
    endif
  endif
  $ " move the last line
  call LogNav#DialogStart('b')
endfunction

function! LogNav#EnableFold() " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Attempt to create/close folds based on syntax within a reasanoble ammount of
" time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  setlocal foldmethod=syntax
  " restore foldmethod after the folds are formed, as it makes Vim became very
  " slow, as explained on Vim FAQ 29.7: 'I have enabled syntax based folding.
  " Why is Vim so slow?' - http://vimhelp.appspot.com/vim_faq.txt.html#faq-29.7
  normal! zM
  setlocal foldmethod&
endfunction


let &cpo = save_cpo
" vim: ts=2 sts=0 sw=2 expandtab ff=unix foldmethod=marker :
