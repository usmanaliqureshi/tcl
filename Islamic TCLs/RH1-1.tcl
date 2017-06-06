#First line after how many secs of silence in channel?
set rh_timer(ini) 180

#subsequent lines will be delayed/incrimented more by following setting...
set rh_timer(inc) 40

#No of lines to post Automatically b4 giving up and detecting a dead channel?
set rh_timer(cnt) 5

#List of Host masks seperated by space to be ignored by the BOT
set rh_timer(ign) "Rafeeq!*@* Haris!*@* CodePoet!*@* *!*BSD@*.sttlwa.dsl-w.verizon.net *!*BSD@71.112.*"



  proc rh_reset_timer {chan} {
    global rh_timer RT_Kit tmqb
    tmqb_cs_irc

    set chan [string tolower $chan]

    if {$rh_timer($chan,cnt)<$rh_timer(cnt) } {
      set rh_timer($chan,id) [utimer $rh_timer($chan,du) "rh_reset_timer $chan"]
    } {unset rh_timer($chan,id) ; return 1 }

    if {![info exist RT_Kit(buffer,$chan)]} { after 100 "RT_Queue_IRC $chan" }
    foreach mq_line [tmqb_main auto_$chan "Next ="] { lappend RT_Kit(buffer,$chan) "14Auto:$mq_line 00,00$rh_timer($chan,du)" }

    set rh_timer($chan,du) [expr $rh_timer($chan,du) + $rh_timer(inc)]
    incr rh_timer($chan,cnt)
    return 1
  }

  proc rh_set_timer {nick uhost handle chan text} {
    global rh_timer
    set chan [string tolower $chan]
    set rh_timer($chan,cnt) 1
    
    foreach rh_mask $rh_timer(ign) { 
      if { [string match $rh_mask $nick!$uhost] } {return 0}
    }

    set rh_timer($chan,du) $rh_timer(ini)
    if {[info exists rh_timer($chan,id)]} {
      killutimer $rh_timer($chan,id)
      unset rh_timer($chan,id)
    }
    set rh_timer($chan,id) [utimer $rh_timer($chan,du) "rh_reset_timer $chan"]
  } 

bind pubm - * rh_set_timer

