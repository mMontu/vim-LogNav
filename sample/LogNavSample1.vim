augroup LogNavSample
   au!
   autocmd BufRead,BufNewFile LogNavSample1.log 
            \ let b:lognav_int_agent     = ['\v<(AppGHI|AppXYZ)>'] |
            \ let b:lognav_int_event     = ['\v \zsSIGNAL \w+ (SENT|KILLED)'] |
            \ let b:lognav_ext_msg_start = ['\(<<<\|>>>\)'] |
            \ let b:lognav_ext_msg_end   = ['\v^$'] |
            \ let b:lognav_ext_rec       = ['<<<.*'] |
            \ let b:lognav_ext_sent      = ['>>>.*'] |
            \ let b:lognav_ext_event     = ['\v^(REGISTER|INVITE|ACK|CANCEL|BYE|'.
            \     'OPTIONS|PRACK|SUBSCRIBE|INFO|NOTIFY|SIP/2\.0.*)'] |
            \ let b:lognav_dialog_start  = '\v^SUBSCRIBE\_.{-}^\zsINVITE' |
            \ setfiletype LogNav
augroup END

