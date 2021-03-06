" vim-LogNav: syntax highlight for generic log files
" Maintainer: Marcelo Montu

let save_cpo = &cpo   " allow line continuation
set cpo&vim

" constants {{{1
let s:PLUGIN_TAG = '[LogNav] '


function! LogNav#DialogStart(direction) " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move the cursor and highlight the line of the next/previous block/dialog
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if !exists('b:lognav_dialog_start')
    echohl Question
    echomsg s:PLUGIN_TAG."b:lognav_dialog_start is not defined!"
    echohl None
  elseif search(b:lognav_dialog_start, 'W'.a:direction)
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
" Attempt to create/close folds based on syntax within a reasonable amount of
" time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " clear existing folds in order to avoid error messages when using sessions
  " and the files shrinks 
  normal! zE
  setlocal foldmethod=syntax
  " restore foldmethod after the folds are formed, as it makes Vim became very
  " slow, as explained on Vim FAQ 29.7: 'I have enabled syntax based folding.
  " Why is Vim so slow?' - http://vimhelp.appspot.com/vim_faq.txt.html#faq-29.7
  normal! zM
  setlocal foldmethod&
endfunction

function! LogNav#Sample() " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uses a sample log file to display the intended use for this plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let logFile = split(globpath(&runtimepath, "**/" . 'LogNavSample1.log'), "\n")[0]
  let config = split(globpath(&runtimepath, "**/" . 'LogNavSample1.vim'), "\n")[0]
  exe 'source 'config
  tabe
  exe 'silent read '.logFile
  1d
  call s:setTempBuffer()
  exe 'silent botright vnew '.logFile
  edit
  1   " move to ther first line
  windo setlocal scrollbind

  call LogNav#DialogStart('')
endfunction

function! LogNav#SampleConfig() " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Displays a sample configuration for this plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let config = split(globpath(&runtimepath, "**/" . 'LogNavSample1.vim'), "\n")[0]
  exe 'silent botright new'
  exe 'silent read '.config
  1d
  call s:setTempBuffer()
endfunction

function! LogNav#Clean() " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" executes the commands defined in b:lognav_clean_cmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if !exists('b:lognav_clean_cmd')
    echohl Question
    echomsg s:PLUGIN_TAG."b:lognav_clean_cmd is not defined!"
    echohl None
  else
    exe b:lognav_clean_cmd
  endif
endfunction

function! s:setTempBuffer() " {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Select settings of a temporary/scratch buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   setlocal buftype=nofile
   setlocal bufhidden=delete
   setlocal noswapfile
   setlocal nomodifiable
   setlocal textwidth=0 " avoid automatic line break
endfunction



let &cpo = save_cpo
" vim: ts=2 sts=0 sw=2 expandtab ff=unix foldmethod=marker :
