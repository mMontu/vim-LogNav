" Vim syntax file
" Maintainer: Marcelo Montu

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
let s:cpo_save = &cpo
set cpo&vim

syntax clear
syntax case match

if exists("b:lognav_int_agent")
  for s:elem in b:lognav_int_agent
    exe "syn match logNavIntAgent '".s:elem."'"
  endfor
endif

if exists("b:lognav_int_event")
  for s:elem in b:lognav_int_event
    exe "syn match logNavIntEvent '".s:elem."'"
  endfor
endif

if exists("b:lognav_ext_msg_start") && exists("b:lognav_ext_msg_end")
  for s:i in range(min([len(b:lognav_ext_msg_start), len(b:lognav_ext_msg_end)]))
    exe "syn region logNavExtMsg start='".b:lognav_ext_msg_start[s:i].
          \ "' end='". b:lognav_ext_msg_end[s:i].
          \ (exists('b:lognav_fold_ext_msg') ? "' fold ": "' ").
          \ 'contains=logNavExtEvent,logNavExtRec,logNavExtSent'
  endfor
endif

if exists("b:lognav_ext_rec")
  for s:elem in b:lognav_ext_rec
    exe "syn match logNavExtRec contained '".s:elem."'"
  endfor
endif

if exists("b:lognav_ext_sent")
  for s:elem in b:lognav_ext_sent
    exe "syn match logNavExtSent contained '".s:elem."'"
  endfor
endif


if exists("b:lognav_ext_event")
  for s:elem in b:lognav_ext_event
    exe "syn match logNavExtEvent contained '".s:elem."'"
  endfor
endif


" Define the default highlighting.
hi def link logNavIntAgent Statement
hi def link logNavIntEvent Special
hi def link logNavExtMsg   Comment
hi def link logNavExtEvent Type
hi def link logNavExtRec   ModeMsg
hi def link logNavExtSent  Question


" sync method:
if !exists('b:lognav_min_lines')
  let b:lognav_min_lines = 50
endif
exe 'syn sync ccomment logNavExtMsg minlines='.b:lognav_min_lines


" fold method:
if (exists('b:lognav_fold_ext_msg'))
  call LogNav#EnableFold()
endif


let b:current_syntax = "LogNav"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=2 sts=0 sw=2 expandtab :
