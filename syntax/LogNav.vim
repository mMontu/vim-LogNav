" Vim syntax file
" Maintainer: Marcelo Montu <https://github.com/mMontu/vim-LogNav>

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
let s:cpo_save = &cpo
set cpo&vim

syntax clear
syntax case match

if exists("b:lognav_int_agent")
  exe "syn match logNavIntAgent '".b:lognav_int_agent."'"
endif

if exists("b:lognav_int_event")
  exe "syn match logNavIntEvent '".b:lognav_int_event."'"
endif

if exists("b:lognav_ext_msg_start") && exists("b:lognav_ext_msg_end")
  exe "syn region logNavExtMsg start='".b:lognav_ext_msg_start.
        \ "' end='". b:lognav_ext_msg_end."' ".
        \ 'contains=logNavExtEvent,logNavExtRec,logNavExtSent'
endif

if exists("b:lognav_ext_rec")
  exe "syn match logNavExtRec contained '".b:lognav_ext_rec."'"
endif

if exists("b:lognav_ext_sent")
  exe "syn match logNavExtSent contained '".b:lognav_ext_sent."'"
endif

if exists('b:lognav_ext_event')
  exe "syn match logNavExtEvent contained '".b:lognav_ext_event."'"
endif


" Define the default highlighting.
hi def link logNavIntAgent Statement
hi def link logNavIntEvent Special
hi def link logNavExtMsg   Comment
hi def link logNavExtEvent Type
hi def link logNavExtRec   ModeMsg
hi def link logNavExtSent  Question


" sync method:
if !exists('b:LogNavMinLines')
  let b:LogNavMinLines = 50
endif
exe 'syn sync ccomment logNavExtMsg minlines='.b:LogNavMinLines


let b:current_syntax = "LogNav"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=2 sts=0 sw=2 expandtab :
