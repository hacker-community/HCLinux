# xformat.m for xenon.irc

@x.formats=[yes]
^set input_prompt ${prp}(${cyn}$sar(/#/${hcyn}#${cyn}/$T)${prp}) ${cl}
set format_action $x.actchr ${cyn}$1${wht} $4-
set format_action_ar $x.actchr ${cyn}$1${wht} $4- 
set format_action_channel $x.actchr ${cyn}$1${wht} $4-
set format_action_other $x.actchr ${cyn}$1${wht} $4-
set format_action_other_ar $x.actchr ${cyn}$1${wht} $4-
set format_action_user $x.actchr ${cyn}$1${wht} $4-
set format_action_user_ar $x.actchr ${cyn}$1${wht} $4-
set format_bwall ${hblk}[${hcyn}b${cyn}X-Wall${prp}!${cyn}$1${prp}(${hcyn}$2${prp})${hblk}]${cl} $4-
set -format_away 
set -format_back
fset format_channel_signoff $G ${hblk}[${hcyn}s${cyn}ignoff${prp}!${cyn}$3${hblk}]${hwht}: ${wht}$1 ${hblk}[${wht}$4- ${hwht}(${wht}$Z${hwht})${hblk}]${cl}
set format_connect $G ${hcyn}c${cyn}onnecting ${CI}$1${CB}:${CI}$2
set format_ctcp $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_cloak_func $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_cloak_func_user $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_cloak_unknown $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_cloak_unknown_user $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_cloak_user $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_func $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_func_user $G � ${hblk}[${hcyn}c${cyn}tcp${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $4-
set format_ctcp_reply $G � ${hblk}[${hcyn}r${cyn}eply${prp}!${cyn}$1${prp}(${cyn}$2${prp})${cyn}$tolower($3)${hblk}]${hwht}:${wht} $4-
set format_dcc_chat ${hwht}�${cyn}$1${prp}(${hcyn}d${cyn}cc${prp})${hwht}� %n$3-
set format_dcc_chat ${CH}<${CIH}$1${CH}> %n$3-
set format_dcc_connect $G ${hcyn}d${cyn}cc $tolower($1) connect ${prp}$2${hblk}[${cyn}$4${hwht}:${cyn}$5${hblk}]
set format_dcc_error $G ${hcyn}d${cyn}cc $tolower($1) lost ${prp}$2${hblk}[${cyn}$3-${hblk}]
set format_dcc_lost $G ${hcyn}d${cyn}cc $tolower($1) complete ${prp}$2${hblk}[${cyn}$3${hblk}] ${wht}$4 $5 $6s ${prp}(${cyn}$8${hwht}/${cyn}s${prp})
set format_dcc_request $G ${hcyn}d${cyn}cc $tolower($1) $2 request ${prp}$3${hblk}[${cyn}$4${hwht}:${cyn}$5${hwht}:${cyn}$6${hblk}] ${wht}$8 $7
set format_disconnect $rpl_err("Not connected")
set format_kick $G ${hblk}[${hcyn}k${cyn}ick${prp}!$sar(/#/${hcyn}#${cyn}/$2)${hblk}]${hwht}: ${prp}$3${wht} kicked by ${prp}$1${wht}${b}:${b} ${cyn}$4-
set format_join $G ${b}${prp}� ${b}${hblk}[${hcyn}j${cyn}oin${prp}!${cyn}$sar(/#/${hcyn}#${cyn}/$3)${hblk}]${hwht}: ${wht}$1${hblk}[${prp}$sar(/@/${cyn}@${prp}/$2) ${hwht}(${wht}$Z${hwht})${hblk}]${cl}
set format_leave $G ${b}${prp}� ${b}${hblk}[${hcyn}p${cyn}art${prp}!${cyn}$sar(/#/${hcyn}#${cyn}/$3)${hblk}]${hwht}: ${wht}$1${hblk}[${prp}$sar(/@/${cyn}@${prp}/$2) ${hwht}(${wht}$Z${hwht})${hblk}]${cl}
fset format_msg $G ${prp}${b}�${b}${hblk}[${hcyn}m${cyn}sg${prp}!${cyn}$1${prp}(${cyn}$sar(/@/${prp}@${cyn}/$2)${prp})${hblk}]${hwht}: ${wht}$3-
set format_mode $G ${hblk}[${hcyn}m${cyn}ode${prp}!${cyn}$3${prp}(${cyn}$1${prp})${hblk}]${wht} $4- 
set format_mode_channel $G ${hblk}[${hcyn}m${cyn}ode${prp}!${cyn}$3${prp}(${cyn}$1${prp})${hblk}]${wht} $4- 
set format_nickname $G ${hblk}[${hcyn}n${cyn}ick${prp}!${cyn}$C${hblk}]${hwht}: ${cyn}$1 ${prp}->${cyn} $3
set format_nickname_other $G ${hblk}[${hcyn}n${cyn}ick${prp}!${cyn}$T${hblk}]${hwht}: ${cyn}$1 ${prp}->${cyn} $3
set format_nickname_user ${hblk}[${hcyn}n${cyn}ick${prp}!${cyn}$T${hblk}]${hwht}: ${cyn}$1 ${prp}->${cyn} $3
set format_notice $G ${hblk}[${hcyn}n${cyn}otice${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}: ${wht} $3-
set format_oper ${hcyn}o${cyn}per ${prp}$1${hblk}[${cyn}$2${hblk}]
set format_paste $G $2-
set format_send_away away${b}:${b} $away.updated
set format_public ${hblk}<${wht}$1${hblk}>${wht} $3-
set format_public_ar ${hblk}<${wht}$1${hblk}>${wht} $3-
set format_public_msg ${hblk}<${wht}$1${hblk}>${wht} $3-
set format_public_msg_ar ${hblk}<${wht}$1${hblk}>${wht} $3-
set format_public_notice $G ${hblk}[${hcyn}p${cyn}notice${prp}!${cyn}$3${prp}(${cyn}$1${prp})${hblk}]${hwht}: ${wht} $4-
set format_public_notice_ar $G ${hblk}[${hcyn}p${cyn}notice${prp}!${cyn}$3${prp}(${cyn}$1${prp})${hblk}]${hwht}: ${wht} $4-
set format_public_other ${hblk}[${cyn}$sar(/#/${hcyn}#${cyn}/$1)${prp}!${cyn}$2${hblk}]${hwht}: ${wht}$3-
set format_public_other_ar ${CB}<${CI}$2${CB}:${CR}$1${CB}> %n$3-
set format_send_action $x.actchr ${cyn}$1${wht} $3-
set format_send_action_ar $x.actchr ${cyn}$1${wht} $3-
set format_send_ctcp ${hblk}� [${hcyn}c${cyn}tcp${prp}!${cyn}$1${hblk}]${hwht}: ${wht}$2-
set format_send_dcc_chat ${hblk}� [${hcyn}d${cyn}cc${prp}${prp}(${cyn}$tolower($1)${prp})${hblk}] ${wht}$2-
set format_send_msg $G ${prp}${b}�${b}${hblk}[${hcyn}s${cyn}endmsg${prp}!${cyn}$1${hblk}]${hwht}: ${wht}$3-
set format_names $3
set format_names_banner $3
set -format_names_footer
fset format_send_notice ${hblk}� [${hcyn}n${cyn}otice${prp}!${cyn}$1${hblk}]${hwht}: ${wht}$3-
set format_send_public ${prp}(${wht}$2${prp})${wht} $3-
set format_send_public_other ${prp}(${wht}$2${prp})${wht} $3-
 set format_server_notice ${CB}[${CH}$1${CB}] ${CH}$2-
 set format_server_notice_kill ${CHH}f${CH}kill ${CIH}$1 ${CB}-> ${CIH}$2
 set format_server_notice_kill_loca ${CHH}l${CH}kill ${CIH}$1 ${CB}-> ${CIH}$2
 set format_server_notice_nickc ${CHH}c${CH}ollide %n$1 killed $2 $3-
 set format_server_notice_oper ${CHH}o${CH}per ${CIH}$2
 set format_server_notice_rehash ${CHH}r${CH}ehash ${CIH}$1
 set format_signoff $G ${CHH}q${CH}uit ${CIH}$1 ${CL}$3-
 set format_smode $G ${CHH}m${CH}ode${CB}:${CH}$3 ${CIH}$1 ${CL}$4-
set format_topic $G ${hblk}[${hcyn}t${cyn}opic${prp}!${cyn}$1${hblk}]${hwht}: ${wht}$2-
set format_topic_change $G ${hblk}[${hcyn}t${cyn}opic${prp}!${cyn}$1${prp}(${cyn}$2${prp})${hblk}]${hwht}:${wht} $3-
set format_usage $G ${CHH}u${CH}sage${CB}: %n/$0 $1-
set format_usermode $G ${hcyn}m${cyn}ode${hwht}: ${prp}$3 ${cyn}%n$4-
set format_whois_away $G ${CB}${prp}�${cyn} ${CHH}a${CH}w${hcyn}a${cyn}y${CB}: %n$0 - $1-
set format_whois_channels $G ${CB}${prp}�${cyn} ${CHH}c${CH}ha${hcyn}nn${cyn}els${CB}: $sar(g/@/${prp}@${wht}/%n$0-)
set format_whois_friend $G ${CB}�   ${CHH}f${CH}riend${CB}: %nF${CB}:%n$0 $1-
set format_whois_header $G ${CB}${prp}������������������������������������-${hwht}x${cyn}enon${prp}��---
set format_whois_help $G ${CB}${prp}�${cyn}     ${CHH}h${CH}elp${CB}: %n$0 - $1
set format_whois_idle $G ${CB}${prp}�${cyn} ${CHH}i${CH}${hcyn}d${cyn}le${CB}: %n$0 hours $1 minutes $2 seconds (signon: $stime($3))
set format_whois_name $G ${CB}${prp}�${cyn} ${CHH}${hcyn}i${CH}${cyn}rcname${CB}: %n$0-
set format_whois_nick $G ${CB}${prp}�${cyn} ${hcyn}$0 ${prp}(${cyn}$1${prp}@${cyn}$2${prp}) ${hblk}[${wht}%n$3-${hblk}] 
set format_whois_oper $G ${CB}${prp}�${cyn} ${CHH}o${CH}pe${hcyn}r${cyn}ator${CB}: %n$0 $1-
set format_whois_register $G ${CB}${prp}�${cyn} ${CHH}r${CH}eg${hcyn}is${cyn}ter${CB}: %n$0 - $1-
set format_whois_server $G ${CB}${prp}�${cyn} ${CHH}s${CH}er${hcyn}v${cyn}er${CB}: %n$0 ($1-)
set format_whois_service $G ${CB}�   ${CHH}s${CH}ervice${CB}: %n$0 - $1- 
set format_whois_shit ${CB}�      ${CHH}s${CH}hit${CB}: %nL:$1 [$1] $2 $3-
set format_whois_signon ${CB}${prp}�${cyn} ${CHH}s${CH}${hcyn}ignon${CB}: %n$0-
eval set status_cdcccount ${CIH}c${CI}dcc${CB}:${CHH}i${CB}�${CH}%| ${CHH}o${CB}:${CH}%|${CB}�
eval set status_dcccount ${CIH}d${CI}cc${CB}:${CHH}i${CB}�${CH}%& ${CHH}o${CB}:${CH}%&${CB}�
eval set status_format1 ${cl}${cyn}��� ${prp}�${hblk}[${b}%*%=%@${cyn}%N${cyn}%#${prp})${hblk}]${b}${hmag}�${cyn}%C${cyn}%+%W%! %>%F %D%J${hblk}[${cyn}%L${prp}$t2()${hblk}]${prp}ķ
eval set status_format2 ${cl}${cyn}� � ${prp}�${hblk}[${b}${hwht}x${cyn}enon%T${hblk}]${hmag}�${prp}%A%Q %>%S${prp}�
eval set status_format3 ${cl}${hblk}[${hcyn}t${cyn}opic${prp}!${cyn}%C${hblk}]${hwht}: ${wht}%- %>
eval set status_lag ${hcyn}l${cyn}ag${prp}!${cyn}%L
eval set status_notify ${hcyn}a${cyn}ct${prp}!${hcyn}%F${cyn}
eval set status_chanop ${hcyn}@${prp}
eval set status_voice ${hcyn}+${prp}
eval set status_oper ${hcyn}*${prp}
eval set status_umode ${prp}\(${cyn}+%#
eval set status_away ${hblk}[${hcyn}a${cyn}way${hblk}]${prp}
eval set status_query ${hblk}[${hcyn}Q${cyn}${prp}!${cyn}%Q${hblk}]${prp}
eval set status_channel ${cyn}%C${prp}
eval set status_mode ${prp}\(${hcyn}+${cyn}%+${prp})${hmag}�
eval set status_users ${hblk}[${hcyn}o${cyn}%!${prp}!${hcyn}n${cyn}%!${prp}!${hcyn}i${cyn}%!${prp}!${hcyn}v${cyn}%!${hblk}]${prp}
eval set status_clock ${hcyn}${cyn}${prp}\(${cyn}%T${prp})${prp}
## eval set status_clock ${prp}�${hblk}[${hcyn}T${prp}!${cyn}%T${hblk}]${prp}-${prp}
eval set status_server ${hmag}�${hblk}[${hcyn}s${cyn}erver${prp}!${cyn}%S${prp}${hblk}]${prp}
### 


alias _status.update {
 ^wset * status_away $status_away
 ^wset * status_cdcccount $status_cdcccount
 ^wset * status_channel $status_channel
 ^wset * status_chanop $status_chanop
 ^wset * status_clock $status_clock
 ^wset * status_cpusaver $status_cpusaver
 ^wset * status_dcccount $status_dcccount
 ^wset * status_does_expandos $status_does_expandos
 ^wset * status_flag $status_flag
 ^wset * status_format $status_format
 ^eval wset * status_format1 $status_format1
 ^eval wset * status_format2 $status_format2
 ^eval wset * status_format3 $status_format3
 ^wset * status_halfop $status_halfop
 ^wset * status_hold $status_hold
 ^wset * status_hold_lines $status_hold_lines
 ^wset * status_insert $status_insert
 ^wset * status_lag $status_lag
 ^wset * status_mail $status_mail
 ^wset * status_mode $status_mode
 ^wset * status_msgcount $status_msgcount
 ^wset * status_nick $status_nick
 ^wset * status_notify $status_notify
 ^wset * status_no_repeat $status_no_repeat
 ^wset * status_oper $status_oper
 ^wset * status_oper_kills $status_oper_kills
 ^wset * status_overwrite $status_overwrite
 ^wset * status_query $status_query
 ^wset * status_scrollback $status_scrollback
 ^wset * status_server $status_server
 ^wset * status_topic $status_topic
 ^wset * status_umode $status_umode
 ^wset * status_user0 $status_user0
 ^wset * status_users $status_users
 ^wset * status_voice $status_voice
 ^wset * status_window $status_window
}

^eval _status.update


