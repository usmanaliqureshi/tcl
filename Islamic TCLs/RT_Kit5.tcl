
set RT_Kit(version) 5

proc RT_format { txt sz } {
  set lstrange 0
  set cursz 0
  set done 0
  set retval ""

  while {!$done} {
    set wrdf [expr $sz+$lstrange]
    set wrdb [expr [RT_space_before $txt $wrdf]]
    set wrda [expr [RT_space_after $txt $wrdf]]

    if {([expr [string length $txt]-$lstrange] <= $sz)} { 
      set cursz [string length $txt]
      set curtxt [string range $txt $lstrange $cursz]
    } elseif {($wrdb <= $lstrange)} {
      set cursz [expr $wrda - 1]
      set curtxt [string range $txt $lstrange $cursz]
      set lstrange [expr $cursz + 2]
    } else {
      set wrdd [expr $wrda - $wrdb]
      if {($wrdd > 8) && (($wrdf - $wrdb) > 5) && ($sz < 100)} {
        if {($wrda - $wrdf) > 3} {set cursz [expr $wrdf - 2]} {set cursz [expr $wrda - 5]}
        set curtxt "[string range $txt $lstrange $cursz]-"
        set lstrange [expr $cursz + 1]
      } else { set cursz [expr $wrdb - 1]
        set curtxt [string range $txt $lstrange $cursz]
        set lstrange [expr $cursz + 2]
      }
      if {([string first " " $curtxt] > 0) && ($sz < 100)} {
        set insp 0 ; set fdone 0 ; set ltxt 0
        set spcn "  " ; set spco " "
        set tcurtxt ""
        set lcurtxt [string trim $curtxt]
        set spc2add [expr $sz - [string length $lcurtxt]]
        set lcurtxt [split $lcurtxt]
          while {!$fdone} {
            foreach ltxt $lcurtxt {
              if {$spc2add > 0} {
                if {$tcurtxt == ""} {set tcurtxt $ltxt} {set tcurtxt "$tcurtxt$spcn$ltxt"; incr spc2add -1}
                } else {
                if {$tcurtxt == ""} {set tcurtxt $ltxt} {set tcurtxt "$tcurtxt$spco$ltxt"}
              }
            }
            if {$spc2add <= 0} {set fdone 1} {
              set spco "$spcn" ; set spcn "$spco "
              set lcurtxt $tcurtxt ; set tcurtxt ""
            }
          set curtxt $tcurtxt
          }
        }
      }
    if {$cursz >= [string length $txt]} { set done 1 }
    lappend retval $curtxt
  }
  return $retval 
}


proc RT_space_after { txt pnt } {
  set done 0
  set itxt $pnt

  while {!$done} {
    if {($itxt > [string length $txt])} { return [string length $txt] }
    if {($itxt >= $pnt) && ([expr {" " == [string index $txt $itxt]}])} { return $itxt }
    incr itxt
  }
}


proc RT_space_before { txt pnt } {
  set done 0
  set itxt $pnt

  while {!$done} {
    if {($itxt < 0)} { return $pnt }
    if {($itxt <= $pnt) && ([expr {" " == [string index $txt $itxt]}])} { return $itxt }
    incr itxt -1
  }

}


proc serial2index {serial series} {
  set temp1 0
  set temp2 0
  set index1 0

  while {$temp2 < $serial} {
    incr index1
    set temp1 [lindex $series $index1]
    set temp2 [expr $temp2 + $temp1]
  }

  return "$index1 [expr $serial - ($temp2 - $temp1)]"
}


proc index2serial {index1 index2 series} {
  set temp 0

  for {set cnter 0} {$cnter<$index1} {incr cnter} {
    set temp [expr $temp+[lindex $series $cnter]]
  }

  return "[expr $temp + $index2]"
}


proc total_from_list {list2total} {
  set retval 0
  foreach val $list2total {set retval [expr $retval + $val]}
  return $retval
}


proc RT_read_line { rl_file_name rl_line } {
  if {![file exist $rl_file_name]} { return "File not Found." }

  set rl_file [open $rl_file_name]

  for {set rl_seek 1} {$rl_seek<$rl_line} {incr rl_seek} {
    set rl_text [gets $rl_file]
  }

  set rl_retval [gets $rl_file]

  close $rl_file
  return $rl_retval
}



proc RT_read_topic { rt_file_name rt_topic } {
  if {![file exist $rt_file_name]} { return [list "File not Found."] }

  set rt_file [open $rt_file_name]
  set rt_retval ""

  while {![eof $rt_file]} {
    if {[string  match \\\[$rt_topic\\\] [gets $rt_file]]} {break}
  }
  
  while {![eof $rt_file]} {
    set rt_text [gets $rt_file]
    if {[string match \\\[*\\\] $rt_text]} {break}

    if {[string trim $rt_text] != ""} { lappend rt_retval $rt_text }
  }

  close $rt_file
  return $rt_retval
}


proc RT_search_line { sl_file_name sl_words } {
  if {![file exist $sl_file_name]} { return [list "File not Found."] }

  set sl_file [open $sl_file_name]
  set sl_line 0
  set sl_word [string tolower $sl_words]
  set sl_retval ""

  while {![eof $sl_file]} {
    set sl_txt [string tolower [gets $sl_file]]
    set sl_search 1
    incr sl_line

    foreach sl_sword $sl_word {
      set sl_search [expr $sl_search * [string match *$sl_sword* $sl_txt]]
      if {!$sl_search} {break}
    }

    if {$sl_search} {lappend sl_retval $sl_line}
  }

  close $sl_file
  return $sl_retval
}


proc RT_search_topic { st_file_name st_words } {
  if {![file exist $st_file_name]} { return [list "File not Found."] }

  set st_file [open $st_file_name]
  set sl_topic ""
  set st_word [string tolower $st_words]
  set st_txt [string tolower [gets $st_file]]
  set st_retval ""

  while {![eof $st_file]} {
    set st_search 1
    set st_txts ""


    if {[string match \\\[*\\\] $st_txt]} {
      set st_topic [string range $st_txt 1 [expr [string length $st_txt]-2]] 
      while {![eof $st_file]} { 
        set st_txt [string tolower [gets $st_file]]
        if {[string match \\\[*\\\] $st_txt]} {break}
        append st_txts $st_txt
      }
    }

    foreach st_sword $st_word {
      set st_search [expr $st_search * [string match *$st_sword* $st_txts]]
      if {!$st_search} {break}
    }

    if {$st_search} { lappend st_retval $st_topic}
  }

  close $st_file
  return $st_retval
}

# new Functions

proc RT_lappend {RT_old_list RT_new_list} {
  foreach RT_new_element $RT_new_list {
    if {[lsearch $RT_old_list $RT_new_element]=="-1"} {
      lappend RT_old_list $RT_new_element
    }
  }
  return $RT_old_list
}

proc RT_emph {RT_text RT_words RT_emph_start RT_emph_end} {
  foreach RT_word $RT_words {
    set RT_emph_begin 0
    for {set RT_count 0} {$RT_count<5} {incr RT_count} {
      set RT_emph_first [string first [string tolower $RT_word] [string range [string tolower $RT_text] $RT_emph_begin end]]
      if {$RT_emph_first>-1} {
        set RT_text "[string range $RT_text 0 [expr $RT_emph_first+$RT_emph_begin-1]]$RT_emph_start[string range $RT_text [expr $RT_emph_first+$RT_emph_begin] [expr $RT_emph_begin+$RT_emph_first+[string length $RT_word]-1]]$RT_emph_end[string range $RT_text [expr $RT_emph_begin+$RT_emph_first+[string length $RT_word]] end]"
        set RT_emph_begin [expr $RT_emph_begin+$RT_emph_first+[string length $RT_word]+[string length $RT_emph_start]+[string length $RT_emph_end]]
      } {set RT_count 11}
    }
  }
  return $RT_text
}


proc RT_show_context {RT_texts RT_words RT_emph1 RT_emph2} {
  set RT_out ".."
  set RT_cnt 0
  foreach RT_word $RT_words {
    foreach RT_text $RT_texts {
      set RT_wrd_idx [string first [string tolower $RT_word] [string tolower $RT_text]] 
      set RT_text_c [string length $RT_text]
        if {$RT_wrd_idx<50} {set RT_first 0} {set RT_first [expr $RT_wrd_idx-50]}
        if {[expr $RT_first+100] > $RT_text_c} {set RT_last $RT_text_c} {set RT_last [expr $RT_first+100]}
        set RT_start [RT_space_before $RT_text $RT_first]
        set RT_end   [RT_space_after  $RT_text $RT_last]

# && [expr $RT_last-$RT_first]>30
      if {$RT_wrd_idx>-1} { 
        append RT_out "$RT_emph1[string range $RT_text $RT_start $RT_end]$RT_emph2.."
        incr RT_cnt 1
        if {$RT_cnt>2} {return $RT_out}
        set RT_idx [lsearch $RT_texts $RT_text]
        set RT_texts [lreplace $RT_texts $RT_idx $RT_idx [string range $RT_text 0 [expr $RT_start-1]] [string range $RT_text [expr $RT_end+1] end]]
      } 
    }
  }
  return $RT_out
}

proc strip_html {html} {
  set sh_first 1
  while {$sh_first!=-1} {
    set sh_first [string first "<" $html]
    set sh_last [string first ">" $html $sh_first] 

    if {$sh_first>=0 && $sh_last>$sh_first} {
      set html [string replace $html $sh_first $sh_last]
    } { set sh_first -1 }
  }
  return $html
}

proc RT_Queue_IRC { who } {
  global RT_Kit tmqhb

  foreach mq_bot $tmqhb(bots) {
    if {[onchan $mq_bot $who]} { unset RT_Kit(buffer,$who) ; return 0 }
  }

  if {![info exist RT_Kit(buffer,$who)]} { return 1 }
  set RT_buf_len [llength $RT_Kit(buffer,$who)]

  if {$RT_buf_len} {
    putserv "PRIVMSG $who :[lindex $RT_Kit(buffer,$who) 0]"
    set RT_Kit(buffer,$who) [lrange $RT_Kit(buffer,$who) 1 end]
  } {
    putserv "PRIVMSG $who :No more buffer." ; return 1
  }
  if {$RT_buf_len>1} { after 2000 "RT_Queue_IRC $who" } { unset RT_Kit(buffer,$who) }

  return 1
}


proc RT_Queue_GAIM { acc who } {
  global RT_Kit
  if {![info exist RT_Kit(buffer,$acc,$who)]} { return 0 }

  set RT_buf_len [llength $RT_Kit(buffer,$acc,$who)]

  if {$RT_buf_len} {

    gaim::conv_send $acc $who [lindex $RT_Kit(buffer,$acc,$who) 0]
    set RT_Kit(buffer,$acc,$who) [lrange $RT_Kit(buffer,$acc,$who) 1 end]
  } {
    gaim::conv_send $acc $who "No more buffer." ; return 1 
  }
  if {$RT_buf_len>1} { after 2000 "RT_Queue_GAIM $acc $who" } { unset RT_Kit(buffer,$acc,$who) }
}

#Following Line is only for TCL for Eggdrop.

if {[info exists version]} {
  putlog "Load Success.......RT Kit Version $RT_Kit(version) by Rafeeq"
}

