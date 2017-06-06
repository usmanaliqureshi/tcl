#############################################################################
#                     BismIllah Hir-rah Manir Raheem                        #
#                                                                           #
#                       The Mighty Hadeeth BOT 5.4                          #
#                                                                           #
#                        Make Dua for one and All.                          #
#                                                                           #
#############################################################################

#############################################################################
#                           Do or die things.                               #
#############################################################################

# Which Translation do you like to use as default. If any1 says 'Hadeeth 1'
set tmhb(hd_def) sb

#############################################################################
#                  If you wish to tweak / set it to ur choice.              #
#############################################################################

# Enter all the Translation initails used in this script.
set tmhb(hd_list) "sb sm ad mm rs nh nm qh du h5 ib kh qa ab"

# Enter number of lines to show if the hadeeth is too long.
set tmhb(buffer,limit) 7

#############################################################################
#  Dont exceed this limit, even if you wish then do it on your own risk ;)  #
#  BEWARE!!! H A R M F U L L   C O D E S   B E L O W   T H I S   L I N E .  #
#############################################################################

set tmhb(version) 5.4
set tmhb(name) "The Mighty Hadeeth BOT"


  if {[info exists gaim::version]} {
    namespace import gaim::*
    set tmhb(log) "gaim::debug -info \"TMHB\""
  } {
    set tmhb(log) "putlog"
  }
  


 
  
eval "$tmhb(log) \"Trying to load.......$tmhb(name) $tmhb(version), InshaAllah\""


if {[info exists RT_Kit]} {
  if {!$RT_Kit(version)==5} {
      eval "$tmhb(log) \"*** ERROR: Can't load $tmhb(name) $tmhb(version) -- First Load RT_Kit5.tcl\""
    return 0
  }
}

#############################################################################
#                               Main Codes                                  #
#############################################################################

#############################################################################
#                          One time initialisation                          #
#############################################################################

  set tmhb(hd_list) [string tolower $tmhb(hd_list)]
  eval "$tmhb(log) \"Looking for $tmhb(name) DATA Files.\""

  foreach hd_bk $tmhb(hd_list) {
    if {![file exist $tmhb(root)/$hd_bk-info]} {
      eval "$tmhb(log) \"*** WARNING: $hd_bk-info file missing from $tmhb(root) directory. Hence disabling $hd_bk option.\""
      set tmhb(valid,$hd_bk) 0
      set tmhb(ban1,$hd_bk) "-"
      set tmhb(ban2,$hd_bk) "-"
      set tmhb(alias,$hd_bk) "$hd_bk"
    } {
      set tmhb(valid,$hd_bk) 1
      set tmhb(ban1,$hd_bk) [RT_read_line $tmhb(root)/$hd_bk-info 1]
      set tmhb(ban2,$hd_bk) [RT_read_line $tmhb(root)/$hd_bk-info 2]
      set tmhb(alias,$hd_bk) "[RT_lappend $hd_bk [string tolower [RT_read_line $tmhb(root)/$hd_bk-info 3]]] all compare"
      set tmhb(file_cnt,$hd_bk) [RT_read_line $tmhb(root)/$hd_bk-info 4]
      set tmhb(bk_name,$hd_bk) [RT_read_line $tmhb(root)/$hd_bk-info 5]
      set tmhb(bk_cnt,$hd_bk) [RT_read_line $tmhb(root)/$hd_bk-info 6]
      set tmhb(vol_cnt,$hd_bk) [RT_read_line $tmhb(root)/$hd_bk-info 7]
      set tmhb(total,$hd_bk) [total_from_list $tmhb(file_cnt,$hd_bk)]
    }
  }

  if {[info exists tmhb(hd_def)]} {
    if {!$tmhb(valid,$tmhb(hd_def))} { 
      eval "$tmhb(log) \"*** ERROR: Default Hadeeth Data files are missing?\""
      eval "$tmhb(log) \"*** ERROR: Failed to load $tmhb(name)\"" ; return 0 } 
  } { eval "$tmhb(log) \"*** ERROR: Edit your Script and set tmhb(hd_def) <code>\"";
    eval "$tmhb(log) \"*** ERROR: Failed to load $tmhb(name)\"" ; return 0
  }
  unset hd_bk

  set tmhb(emph_wrds) "Allah Muhammad Quran Qur\'an Merciful Paradise {Hell Fire} Forgiveness Messenger prophet obey follow love Commentary Chapter Book"
  set tmhb(ban1,al) "Ahadeeth - For more info type: Hadeeth Translations"
  set tmhb(ban2,al) "For more info type: Hadeeth Translations"
  set tmhb(alias,al) "compare max $tmhb(hd_list)"


proc tmhb_cs_irc { } {
  global tmhb
  set tmhb(c,1s) 00,02
  set tmhb(c,1e) 
  set tmhb(c,2s) 02,15
  set tmhb(c,2e) 
  set tmhb(c,hl) 08
  set tmhb(c,rs) 
  set tmhb(c,re) 
  set tmhb(c,bs) 
  set tmhb(c,be) 
  set tmhb(c,us) 
  set tmhb(c,ue) 
  set tmhb(c,Bs) 02
  set tmhb(c,Be) 
  set tmhb(c,Ls) 12
  set tmhb(c,Le) 
  set tmhb(c,Rs) 04
  set tmhb(c,Re) 
  set tmhb(c,Gs) 14
  set tmhb(c,Ge) 
  set tmhb(c,0s) 00
  set tmhb(c,0e) 
}
	
proc tmhb_cs_yahoo { } {
  global tmhb
  set tmhb(c,1s) "<font face=\"Fixedsys\"><font color=\"#008F00\"><b>"
  set tmhb(c,1e) "</b></font></font>"
  set tmhb(c,2s) "<font face=\"Fixedsys\"><font color=\"#00007F\">"
  set tmhb(c,2e) "</font></font>"
  set tmhb(c,hl) "<font color=\"#00F700\">"
  set tmhb(c,rs) "<i>"
  set tmhb(c,re) "</i>"
  set tmhb(c,bs) "<b>"
  set tmhb(c,be) "</b>"
  set tmhb(c,us) "<u>"
  set tmhb(c,ue) "</u>"
  set tmhb(c,Bs) "<font color=\"#00007F\">"
  set tmhb(c,Be) "</font>"
  set tmhb(c,Ls) "<font color=\"#8000FF\">"
  set tmhb(c,Le) "</font>"
  set tmhb(c,Rs) "<font color=\"#FF0000\">"
  set tmhb(c,Re) "</font>"
  set tmhb(c,Gs) "<font color=\"#7F7F7F\">"
  set tmhb(c,Ge) "</font>"
  set tmhb(c,0s) "<font color=\"#000000\">"
  set tmhb(c,0e) "</font>"

}

  
#set web_color(0) "#FFFFFF"
#set web_color(1) "#000000"
#set web_color(2) "#00007F"
#set web_color(3) "#008F00"
#set web_color(4) "#FF0000"
#set web_color(5) "#7F0000"
#set web_color(6) "#9F009F"
#set web_color(7) "#FF7F00"
#set web_color(8) "#F0FF00"
#set web_color(9) "#00F700"
#set web_color(10) "#008F8F"
#set web_color(11) "#00F7FF"
#set web_color(12) "#0000FF"
#set web_color(13) "#FF00FF"
#set web_color(14) "#7F7F7F"
#set web_color(15) "#CFCFCF"

#  set tmhb(c,1s) 00,02            # Banner Line Start
#  set tmhb(c,1e)                  # Banner Line End
#  set tmhb(c,2s) 02,15            # Body Line Start
#  set tmhb(c,2e)                  # Body Line End
#  set tmhb(c,hl) 02,08            # Highlighted words
#  set tmhb(c,rs)                  # Reverse Start
#  set tmhb(c,re)                  # Reverse End
#  set tmhb(c,bs)                  # Bold Start
#  set tmhb(c,be)                  # Bold End
#  set tmhb(c,us)                  # Underline Start
#  set tmhb(c,ue)                  # Underline End
#  set tmhb(c,rs) 03               # Red Start
#  set tmhb(c,re)                  # Red End
#  set tmhb(c,gs) 14               # Gray End
#  set tmhb(c,ge)                  # Gray End


#############################################################################
#          Following codes are used to perform IRC Parsings.                #
#############################################################################

proc tmhb_main {who hd_args} {
  global tmhb
  set hd_arg ""
  set hd_bk_requ ""
  set who [string tolower $who]
# eval "$tmhb(log) \"ok: $who -=- $hd_args\""

  foreach hd_arg_vrb [string tolower $hd_args] {lappend hd_arg $hd_arg_vrb}

  foreach hd_trans_check $hd_arg {
    foreach hd_bk $tmhb(hd_list) {
      foreach hd_alias_in $tmhb(alias,$hd_bk) {
        if {[string match $hd_alias_in $hd_trans_check]} {
          set hd_bk_requ [RT_lappend $hd_bk_requ $hd_bk]
          set hd_arg [lreplace $hd_arg [lsearch $hd_arg $hd_alias_in] [lsearch $hd_arg $hd_alias_in]]
          set hd_bk_found 1
        }
      }
    }
  }

  if {![info exists hd_bk_found]} {
    set hd_bk_requ $tmhb(hd_def)
  } 
  set hd_bk [lindex $hd_bk_requ 0]
  if {$tmhb(valid,$hd_bk) == 0} {return [list "$tmhb(c,1s) This option is disabled. Possibly files missing. $tmhb(c,1e)"]}
  if {![info exists tmhb(last,$hd_bk,$who)]} {set tmhb(last,$hd_bk,$who) 1}

  set hd_ret_val [switch -glob [lindex $hd_arg 0] {
    [0-9]* {format 0}
    set {
      if {[info exist [lindex $hd_args 1]]} {
        if {[lindex $hd_args 2]==""} {
          return [list "$[lindex $hd_args 1] = [expr $[lindex $hd_args 1]]"]
        } {
          set hd_old_arg [expr $[lindex $hd_args 1]]
          set [lindex $hd_args 1] [lrange $hd_args 2 end]
          return [list "Setting $tmhb(c,us)[lindex $hd_args 1]$tmhb(c,ue) from $tmhb(c,ue)$hd_old_arg$tmhb(c,ue) to $tmhb(c,ue)[lrange $hd_args 2 end]$tmhb(c,ue)"] 
        }
      } {
        return [list "Theres no variable like [lindex $hd_args 1]."]}
    }
    help {
      lappend hd_reptxt "$tmhb(c,1s) [RT_read_line $tmhb(root)/$hd_bk-info 11] $tmhb(c,0e)V$tmhb(version). $tmhb(c,1e)"
      lappend hd_reptxt "$tmhb(c,2s) [RT_read_line $tmhb(root)/$hd_bk-info 12] $tmhb(total,$hd_bk). $tmhb(c,2e)"
      lappend hd_reptxt "$tmhb(c,2s) [RT_read_line $tmhb(root)/$hd_bk-info 13] $tmhb(c,2e)"
      lappend hd_reptxt "$tmhb(c,2s) [RT_read_line $tmhb(root)/$hd_bk-info 14] $tmhb(c,2e)"
      lappend hd_reptxt "$tmhb(c,1s) Aliases are [string toupper $tmhb(alias,$hd_bk)] - [RT_read_line $tmhb(root)/$hd_bk-info 15] $tmhb(c,1e)"
      return $hd_reptxt
    }
    transla* { 
      lappend hd_tlist "$tmhb(c,1s) Followings Ahadeeths are available on this BOT $tmhb(c,1e)"
      foreach hd_trans $tmhb(hd_list) {
        if {!$tmhb(valid,$hd_trans)} {continue}
        lappend hd_tlist "$tmhb(c,2s) $tmhb(c,rs)[string toupper $hd_trans]$tmhb(c,re) $tmhb(ban1,$hd_trans) : $tmhb(ban2,$hd_trans) Aliases $tmhb(alias,$hd_trans) $tmhb(c,2e)"
      }
      lappend hd_tlist "$tmhb(c,1s) If you want this BOT or want more files added then contact me. $tmhb(c,1e)"
      return $hd_tlist
    }
    more {
      if {![info exist tmhb(buffer,$who)]} {return [list "$tmhb(c,1s) Nothing in Buffer. $tmhb(c,1e)"]}
      set hd_buffer_l [llength $tmhb(buffer,$who)]
      if {!$hd_buffer_l} { return [list "$tmhb(c,1s) No more lines in Buffer. $tmhb(c,1e)"] }
      for {set hd_a_no 1} {$hd_a_no<=[expr $hd_buffer_l>$tmhb(buffer,limit)?$tmhb(buffer,limit):$hd_buffer_l]} {incr hd_a_no} {
        lappend hd_reptxt [lindex $tmhb(buffer,$who) 0]
        set tmhb(buffer,$who) [lrange $tmhb(buffer,$who) 1 end]
      } 
    return $hd_reptxt
    }
    show {
      if {![info exist tmhb(ser,$who:rslt)]} { return [list "$tmhb(c,1s) First do a successful search then try this command. $tmhb(c,1e)"] }
      set hd_rslt_len [llength $tmhb(ser,$who:rslt)]
      if {![llength $tmhb(ser,$who:rslt)]} { return [list "$tmhb(c,1s) No more search results. $tmhb(c,1e)"] }

      for {set hd_a_no 1} {$hd_a_no<=[expr $hd_rslt_len>3?3:$hd_rslt_len]} {incr hd_a_no} {
        set hd_htxt [tmhb_main $who "[lindex $tmhb(ser,$who:rslt) 0] =[lrange $hd_arg 1 3]"]
        if {[llength $hd_htxt]>1} {
          set hd_crslt [lindex $tmhb(ser,$who:rslt) 0]
          set hd_reptxt_tmp "$tmhb(c,1s)Context of [string totitle [lindex $tmhb(alias,[lindex $hd_crslt 0]) 1]]:"

          if {[lindex $hd_crslt 0]=="sb" || [lindex $hd_crslt 0]=="mm"} {
            append hd_reptxt_tmp "\[[lindex $hd_crslt 1]:[lindex $hd_crslt 2]\]"
          } {
            append hd_reptxt_tmp "\[[lindex $hd_crslt 1]\]"
          }
          lappend hd_reptxt "$hd_reptxt_tmp$tmhb(c,1e)[RT_show_context [tmhb_main $who "$hd_crslt %"] $tmhb(ser,$who:word) $tmhb(c,2s) $tmhb(c,2e)]"
        } {
          foreach hd_rslt $hd_htxt {lappend hd_reptxt $hd_rslt}
        }
        set tmhb(ser,$who:rslt) [lrange $tmhb(ser,$who:rslt) 1 end]
      } 
    return [RT_emph $hd_reptxt $tmhb(ser,$who:word) $tmhb(c,hl) $tmhb(c,2s)]
    }
    rafeeq {return  [list "$tmhb(c,1s)$tmhb(c,Rs) © ®åfèéq$tmhb(c,Rs) © $tmhb(c,1e)"] }
    version {return [list "$tmhb(c,1s)$tmhb(c,Rs) © $tmhb(name) V$tmhb(version) $tmhb(c,Rs) © $tmhb(c,1e)"] }
    credit {return  [list "$tmhb(c,1s)$tmhb(c,Rs) © Make Dua for one and all. $tmhb(c,Rs) © $tmhb(c,1e)"] }
    search {return [hd_search $who $hd_bk_requ [lrange $hd_arg 1 end]]}
    rand* {expr int($tmhb(total,$hd_bk) * rand())}
    next  {expr [expr $tmhb(last,$hd_bk,$who)+1>$tmhb(total,$hd_bk)]?[format 1]:[expr $tmhb(last,$hd_bk,$who)+1]}
    prev* {expr [expr $tmhb(last,$hd_bk,$who)-1<=0]?[format $tmhb(total,$hd_bk)]:[expr $tmhb(last,$hd_bk,$who)-1]}
    last  {expr $tmhb(last,$hd_bk,$who)}
    list - index - [a-z]* {
      if {$hd_bk=="ib"} {
        set hd_term [lindex $hd_arg 0]
        set hd_terms [string tolower $tmhb(bk_name,$hd_bk)]
        set hd_list "a a2 a3 a4 b b2 d d2 e f g h h2 h3 i i2 j k k2 l m m2 m3 m4 m5 n n2 q q2 r r2 s s2 s3 s4 s5 t t2 t3 u w y z"
        if {$hd_arg=="list" || $hd_arg=="index"} {
          return [list "$tmhb(c,1s) Available Indexes are :$tmhb(c,2s) [string toupper $hd_list]. $tmhb(c,1s) $tmhb(c,0s)$tmhb(version) $tmhb(c,1e)"]
        }
        if {[lsearch $hd_list $hd_term]>=0} {format [expr [lsearch $hd_list $hd_term]+1001]} {
          if {[lsearch -glob $hd_terms $hd_term*]>0} {format [lsearch -glob $hd_terms $hd_term*]} {format 0}
        }
      } else {format 0}
    }
  default {format 0}
  }]
  if {$hd_ret_val} {set hd_arg "[serial2index $hd_ret_val $tmhb(vol_cnt,$hd_bk)] [lrange $hd_arg 1 3]"}
  tmhb_irc $who $hd_bk $hd_arg
}

#############################################################################
#          Following codes are used to perform irc postings.                #
#############################################################################

proc tmhb_irc {who hd_bk hd_arg} {
  global tmhb
  set hd_idx1 -1 ; set hd_idx2 0
  set hd_scanarg [split $hd_arg :-.\ ]
  scan [lrange $hd_scanarg 0 2] "%d %d" hd_idx1 hd_idx2
  set hd_opt [lrange $hd_scanarg 1 3]
# set hd_s_time [clock clicks -milliseconds]

  if {$hd_idx1==-1} { error " Ignoring wrong inputs $who $hd_bk $hd_arg "}
  if {$hd_idx1>=1 && $hd_idx2==0} {set hd_idx2 $hd_idx1;set hd_idx1 1}
  if {$hd_idx1>[expr [llength $tmhb(vol_cnt,$hd_bk)]-1]} { return [list "$tmhb(c,1s) Only [expr [llength $tmhb(vol_cnt,$hd_bk)]-1] Volume/Book(s) in $tmhb(ban1,$hd_bk). V$tmhb(version) $tmhb(c,1e)"]}
  if {$hd_idx2>[lindex $tmhb(vol_cnt,$hd_bk) $hd_idx1]} { return [list "$tmhb(c,1s) Volume/Book $hd_idx1 contains [lindex $tmhb(vol_cnt,$hd_bk) $hd_idx1] Ahadeeth in $tmhb(ban1,$hd_bk). V$tmhb(version) $tmhb(c,1e)"]}

  set hd_idx [index2serial $hd_idx1 $hd_idx2 $tmhb(vol_cnt,$hd_bk)]

  if {![expr ($hd_idx<=$tmhb(total,$hd_bk)) && ($hd_idx>=1)]} {
    return [list "$tmhb(c,1s) There are $tmhb(total,$hd_bk) Ahadeeth in $tmhb(ban1,$hd_bk). V$tmhb(version) $tmhb(c,1e)"]
  }

  set hd_size [expr [string match *\#* $hd_opt]?70:380]
  set hd_emp1 [expr [string match *\@* $hd_opt]?"rs":"1s"]
  set hd_emp2 [expr [string match *\@* $hd_opt]?"re":"1e"]
  set hd_emp3 [expr [string match *\@* $hd_opt]?"bs":"2s"]
  set hd_emp4 [expr [string match *\@* $hd_opt]?"be":"2e"]
  set hd_cond [expr [string match *\=* $hd_opt]?1:0]
  set hd_caps [expr [string match *\!* $hd_opt]?1:0]
  set hd_file_no [lindex [serial2index $hd_idx $tmhb(file_cnt,$hd_bk)] 0]
 
  if {!$tmhb(valid,$hd_bk)} {return [list "This option is disabled! Files are missing."]}

  set hd_txt_out ""

  foreach hd_txt [RT_read_topic $tmhb(root)/$hd_bk-$hd_file_no $hd_idx] {
    [expr $hd_cond?"append":"lappend"] hd_txt_out $hd_txt[expr $hd_cond?\" \":\"\"]
  }
  if {$hd_bk=="sb"} { set hd_vol "Vol.$hd_idx1 " } { set hd_vol "" }

  set hd_reptxt_bn1 "$tmhb(c,$hd_emp1) $tmhb(ban1,$hd_bk). $hd_vol[tmhb_idx2book $hd_bk $hd_idx] No.$hd_idx2. $tmhb(c,$hd_emp2)"
  set hd_reptxt_bn2 "$tmhb(c,$hd_emp1) $tmhb(ban2,$hd_bk). $tmhb(c,0s)V$tmhb(version) $tmhb(c,$hd_emp2)"

  if {$hd_caps} {set hd_txt_out [string toupper $hd_txt_out]}
  if {$hd_bk=="sb" || $hd_bk=="mm"} { set hd_vol "$hd_idx1:" } { set hd_vol "" }

  switch -glob $hd_opt {
    *\%* {
      return $hd_txt_out
    }
    *\=* {
      set hd_cond_tmp "$tmhb(c,$hd_emp1) [string totitle [lindex $tmhb(alias,$hd_bk) 1]].$hd_vol$hd_idx2:$tmhb(c,$hd_emp2)$tmhb(c,$hd_emp3)"
      foreach hd_t_cond [RT_format $hd_txt_out 400] {
        lappend hd_reptxt "$hd_cond_tmp $hd_t_cond $tmhb(c,$hd_emp4)"
        set hd_cond_tmp "$tmhb(c,$hd_emp3)"
      }
      set hd_reptxt [lreplace $hd_reptxt end end "[lindex $hd_reptxt end]$tmhb(c,$hd_emp1) [string toupper $hd_bk] $tmhb(c,0s)V$tmhb(version) $tmhb(c,$hd_emp2)"]
    }
    *\^* {
      set hd_size 50
      set hd_dec1 "04,08 | | "
      set hd_dec2 "04,08 |\\\\| "
      set hd_deco 0
      set hd_deco_h "[string toupper $tmhb(ban1,$hd_bk)]"
      set hd_head_l [string length $hd_deco_h]
      set hd_head_1 [expr (($hd_size-$hd_head_l)/2)]
      set hd_head_2 [expr ($hd_size-$hd_head_l)-$hd_head_1]

      set hd_deco_f "Hadeeth.$hd_vol$hd_idx2"
      set hd_foot_l [string length $hd_deco_f]
      set hd_foot_1 [expr (($hd_size-$hd_foot_l)/2)]
      set hd_foot_2 [expr ($hd_size-$hd_foot_l)-$hd_foot_1]
  
      lappend hd_reptxt "04,08 _!_                                                      _!_ "
      lappend hd_reptxt "04,08(___)_[string repeat "_" $hd_head_1]$hd_deco_h[string repeat "_" $hd_head_2]_(___)"
      foreach hd_text_vrb $hd_txt_out {
        foreach hd_formated_text [RT_format $hd_text_vrb $hd_size] {
          lappend hd_reptxt "[expr $hd_deco?"$hd_dec1":"$hd_dec2"]$tmhb(c,$hd_emp3) $hd_formated_text $tmhb(c,$hd_emp4)\00300,15[string repeat " " [expr $hd_size-[string length $hd_formated_text]]][expr $hd_deco?"$hd_dec1":"$hd_dec2"]"
          set hd_deco [expr $hd_deco?0:1]          
        }
      }
      lappend hd_reptxt "04,08(___)_[string repeat "_" $hd_foot_1]$hd_deco_f[string repeat "_" $hd_foot_2]_(___)"

    }
    *\+* {
      set hd_size 50
      set hd_dec1 "06| 13\\\\ 06|"
      set hd_dec2 "06|13\\\\ \\\\06|"
      set hd_deco 0
      set hd_deco_h "[string toupper $tmhb(ban1,$hd_bk)]"
      set hd_head_l [string length $hd_deco_h]
      set hd_head_1 [expr (($hd_size-$hd_head_l)/2)]
      set hd_head_2 [expr ($hd_size-$hd_head_l)-$hd_head_1]

      set hd_deco_f "Hadeeth.$hd_vol$hd_idx2"
      set hd_foot_l [string length $hd_deco_f]
      set hd_foot_1 [expr (($hd_size-$hd_foot_l)/2)]
      set hd_foot_2 [expr ($hd_size-$hd_foot_l)-$hd_foot_1]

      lappend hd_reptxt "06    !                                                          !   "
      lappend hd_reptxt "06  (___) [string repeat " " $hd_head_1] $hd_deco_h [string repeat " " $hd_head_2] (___)"
      lappend hd_reptxt "06 (_____)____________________________________________________(_____)"
      foreach hd_text_vrb $hd_txt_out {
        foreach hd_formated_text [RT_format $hd_text_vrb $hd_size] {
          lappend hd_reptxt "  [expr $hd_deco?"$hd_dec1":"$hd_dec2"] $tmhb(c,$hd_emp3) $hd_formated_text $tmhb(c,$hd_emp4) [string repeat " " [expr $hd_size-[string length $hd_formated_text]]][expr $hd_deco?"$hd_dec1":"$hd_dec2"]"
          set hd_deco [expr $hd_deco?0:1]          
        }
      }
      lappend hd_reptxt " 06(     ) [string repeat " " $hd_foot_1]$hd_deco_f[string repeat " " $hd_foot_2] (     )"

    }
    default {
      lappend hd_reptxt $hd_reptxt_bn1 
      foreach hd_text_vrb $hd_txt_out {
        foreach hd_formated_text [RT_format $hd_text_vrb $hd_size] {
          lappend hd_reptxt "$tmhb(c,$hd_emp3) $hd_formated_text $tmhb(c,$hd_emp4)"
        }
      }
      lappend hd_reptxt $hd_reptxt_bn2
    }
  }

  set tmhb(last,$hd_bk,$who) $hd_idx
#  eval "$tmhb(log) \"Fetch time for $hd_idx $tmqb(c,0s)[expr ([clock clicks -milliseconds]-$hd_s_time)/1000.000]\""
  #return $hd_reptxt
  set hd_reptxt [RT_emph $hd_reptxt $tmhb(emph_wrds) $tmhb(c,us) $tmhb(c,ue)]

  set hd_reptxt_l [llength $hd_reptxt]

  if {$hd_reptxt_l>[expr $tmhb(buffer,limit)*2]} {
    set tmhb(buffer,$who) [lrange $hd_reptxt $tmhb(buffer,limit) end]
    set hd_reptxt [lrange $hd_reptxt 0 [expr $tmhb(buffer,limit)-1]]
    lappend hd_reptxt "$tmhb(c,1s) Hadeeth too long. Shown only $tmhb(buffer,limit) lines out of $hd_reptxt_l. Now type $tmhb(c,us)Hadeeth More$tmhb(c,ue) to read more. $tmhb(c,1e)"
    return $hd_reptxt
  } {
    set tmhb(buffer,$who) ""
    return $hd_reptxt
  }
}

#############################################################################
#           Following codes are used to perform IRC Searches                #
#############################################################################

proc hd_search {who hd_bk_requ hd_args} {
  global tmhb

  foreach hd_trans $hd_bk_requ {
    if {!$tmhb(valid,$hd_trans)} {
      append hd_reptxt [list "$tmhb(c,1s) [string toupper $hd_trans] is disabled! Files are missing. $tmhb(c,1e)"]
      set hd_bk_requ [lreplace $hd_bk_requ [lsearch $hd_bk_requ $hd_trans] [lsearch $hd_bk_requ $hd_trans]]
    }
  }

  set hd_search_start_time [format %.2f [clock clicks -milliseconds]]
  set hd_rst_cnt 0
  set hd_rslt_srl ""
  set hd_rslt ""
  set hd_search_list ""

  foreach hd_st [split $hd_args &] {set hd_search_list [RT_lappend $hd_search_list [string trim $hd_st]]}

  if {$hd_search_list==""} {
    return [list "$tmhb(c,1s) What shall I search for? Give me some clue. Syntax: Hadeeth Search <clue> $tmhb(c,1e)"]
  }

# foreach hd_st $hd_search_lists {append hd_search_list "[string trim $hd_st] "}
  foreach hd_st $hd_search_list {append hd_serlisttxt "$tmhb(c,hl)$tmhb(c,us)[string trim $hd_st]$tmhb(c,ue) \& "}

  if {[llength $hd_bk_requ]>1} { set hd_banner "$tmhb(c,bs)[string toupper $hd_bk_requ]$tmhb(c,be) $tmhb(ban1,al)" } { set hd_banner $tmhb(ban1,$hd_bk_requ) }

  lappend hd_reptxt "$tmhb(c,1s) Searching for [string trimright $hd_serlisttxt "& "] $tmhb(c,1s)in $hd_banner. $tmhb(c,2s)$tmhb(c,ue)"

  foreach hd_bk $hd_bk_requ {
    if {[llength $hd_bk_requ]>1} { set hd_rslt_out "$tmhb(c,1s)[string toupper $hd_bk]$tmhb(c,0s):" } { set hd_rslt_out "" }
    set hd_result_list ""
    set hd_tot_f [llength $tmhb(file_cnt,$hd_bk)]
    for {set hd_fidx 1} {$hd_fidx<$hd_tot_f} {incr hd_fidx} {
      set hd_rslt_tmp "[RT_search_topic $tmhb(root)/$hd_bk-$hd_fidx $hd_search_list] "
      if {[llength $hd_rslt_tmp]>0} {
        if {$hd_bk=="sb" || $hd_bk=="mm"} {
          set hd_old_idx1 ""
          foreach hd_rst $hd_rslt_tmp {
            set hd_rslt_idx [serial2index $hd_rst $tmhb(vol_cnt,$hd_bk)]
            if {$hd_old_idx1!=[lindex $hd_rslt_idx 0]} { append hd_rslt "$hd_rslt_out$tmhb(c,Bs)[lindex $hd_rslt_idx 0]:$tmhb(c,Ls)" ; set hd_rslt_out "" ; set hd_old_idx1 [lindex $hd_rslt_idx 0] }
            append hd_rslt "[lindex $hd_rslt_idx 1] "
            lappend hd_rslt_srl "$hd_bk $hd_rslt_idx"
          }
        } {
          append hd_rslt "$hd_rslt_out$tmhb(c,Bs)$hd_rslt_tmp$tmhb(c,Ls)"
          set hd_rslt_out ""
          foreach hd_rst $hd_rslt_tmp {lappend hd_rslt_srl "$hd_bk $hd_rst"}
        }
      }
    }
  }

  set hd_rst_cnt [llength $hd_rslt_srl]
  set hd_search_ttime [expr ([format %.2f [clock clicks -milliseconds]]-$hd_search_start_time)/1000]
  set tmhb(ser,$who:rslt) $hd_rslt_srl
  set tmhb(ser,$who:word) $hd_search_list
  set tmhb(ser,$who:cnts) $hd_rst_cnt

  switch -glob $hd_rst_cnt {
    0 {
      lappend hd_reptxt " No match found. Try again. $tmhb(c,Rs)$hd_rst_cnt$tmhb(c,Re) Matches in $tmhb(c,Gs)$hd_search_ttime sec$tmhb(c,Ge). $tmhb(c,0s)V$tmhb(version)"
    }
    [1-3] {
      lappend hd_reptxt " Showing below following matches: $hd_rslt - $tmhb(c,Rs)$hd_rst_cnt$tmhb(c,Re) Matches in $tmhb(c,Gs)$hd_search_ttime sec$tmhb(c,Ge). $tmhb(c,0s)V$tmhb(version) "
      foreach hd_rst [tmhb_main $who show] { lappend hd_reptxt $hd_rst }
    }
    [4-9] - [1-4]? {
      lappend hd_reptxt " Matches are: $hd_rslt - $tmhb(c,Rs)$hd_rst_cnt$tmhb(c,Re) Matches in $tmhb(c,Gs)$hd_search_ttime sec$tmhb(c,Ge). $tmhb(c,0s)V$tmhb(version)"
      lappend hd_reptxt "$tmhb(c,1s) To see results type $tmhb(c,us)Hadeeth Show$tmhb(c,ue), repeat for more. $tmhb(c,1e)"
    }  
    default {
      lappend hd_reptxt " Result too long. Narrow your search and try. $tmhb(c,Rs)$hd_rst_cnt$tmhb(c,Re) Matches in $tmhb(c,Gs)$hd_search_ttime sec$tmhb(c,Ge). $tmhb(c,0s)V$tmhb(version)"
    }
  }
  return $hd_reptxt
}


#############################################################################
#                        Book names and other stuff                         #
#############################################################################

proc tmhb_idx2book {hd_bk idx} {
  global tmhb
  set retval 0

  foreach hb_serial $tmhb(bk_cnt,$hd_bk) {
    if {$hb_serial>=$idx} {
      return " Book:$retval. [lindex $tmhb(bk_name,$hd_bk) $retval]."
    }
  incr retval
  }
  return ""
}


#############################################################################
#                    Here goes all bindings for Gaim.                       #
#############################################################################

if {[info exists gaim::version]} {
  gaim::signal connect [gaim::conversation handle] received-im-msg { account who what flags abc } {
    global tmhb RT_Kit
    set args [string tolower [strip_html $what]]

    foreach hd_bk $tmhb(hd_list) {
      if {!$tmhb(valid,$hd_bk)} {continue}
      if {[lindex $args 0]=="[lindex $tmhb(alias,$hd_bk) 1]" || [lindex $args 0]=="![lindex $tmhb(alias,$hd_bk) 1]" } { 
        set arg "$hd_bk [lrange $args 1 end]"
      }
    }
    if {[lindex $args 0]=="hadeeth" || [lindex $args 0]=="hadith" || [lindex $args 0]=="hadis" || [lindex $args 0]=="hadees" } { set arg [lrange $args 1 end] }
    if {[info exists arg]} {
      tmhb_cs_yahoo
      if {![info exist RT_Kit(buffer,$account,$who)]} { after 100 "RT_Queue_GAIM $account $who" }
      foreach hd_line [tmhb_main $who@[gaim::account protocol $account] $arg] {
        lappend RT_Kit(buffer,$account,$who) $hd_line
      }
    }
    catch { unset arg }
    return 0
  }


  gaim::signal connect [gaim::conversation handle] sending-im-msg { account who what } {
    global tmhb RT_Kit
    set args [string tolower [strip_html $what]]

    foreach hd_bk $tmhb(hd_list) {
      if {!$tmhb(valid,$hd_bk)} {continue}
      if {[lindex $args 0]=="[lindex $tmhb(alias,$hd_bk) 1]" || [lindex $args 0]=="![lindex $tmhb(alias,$hd_bk) 1]" } { 
        set arg "$hd_bk [lrange $args 1 end]"
      }
    }
    if {[lindex $args 0]=="hadeeth" || [lindex $args 0]=="!hadeeth" } { set arg [lrange $args 1 end] }

    if {[info exists arg]} {
      tmhb_cs_yahoo
      if {![info exist RT_Kit(buffer,$account,$who)]} { after 100 "RT_Queue_GAIM $account $who" }
      foreach hd_line [tmhb_main $who@[gaim::account protocol $account] $arg] {
        lappend RT_Kit(buffer,$account,$who) $hd_line
      }
      unset arg
    }
    catch { unset arg }
    return 0
  }
}

#############################################################################
#                 Here goes all bindings for IRC/Eggdrops.                  #
#############################################################################

if {[info exists version]} {
  foreach hd_bk $tmhb(hd_list) {
    foreach hd_btype "msg pub dcc" {
      bind $hd_btype -  [lindex $tmhb(alias,$hd_bk) 1] hd_$hd_btype\_$hd_bk
    }
    if {!$tmhb(valid,$hd_bk)} {continue}        
    eval "proc hd_msg_$hd_bk {nick uhost hand args}      { global tmhb RT_Kit ; tmhb_cs_irc ; if {![info exist RT_Kit(buffer,\$nick)]} { after 100 \"RT_Queue_IRC \$nick\" } ; foreach hd_line \[tmhb_main \$nick \"$hd_bk \[lindex \$args 0\]\"\] { lappend RT_Kit(buffer,\$nick) \$hd_line };return 1}"
    eval "proc hd_pub_$hd_bk {nick uhost hand chan args} { global tmhb RT_Kit ; tmhb_cs_irc ; if {![info exist RT_Kit(buffer,\$chan)]} { after 100 \"RT_Queue_IRC \$chan\" } ; foreach hd_line \[tmhb_main \$chan \"$hd_bk \[lindex \$args 0\]\"\] { lappend RT_Kit(buffer,\$chan) \$hd_line };return 1}"
    eval "proc hd_dcc_$hd_bk {hand idx args}             { global tmhb ; tmhb_cs_irc ; foreach hd_line \[tmhb_main \$hand \"$hd_bk \[lindex \$args 0\]\"\] {putdcc \$idx \"\$hd_line\"};return 1}"
  }

  bind msg - hadeeth hd_msg ; bind msg - hadith hd_msg
  bind pub - hadeeth hd_pub ; bind pub - hadith hd_pub
  bind dcc - hadeeth hd_dcc ; bind dcc - hadith hd_dcc

  proc hd_msg {nick uhost hand args}      { global tmhb RT_Kit ; tmhb_cs_irc ; if {![info exist RT_Kit(buffer,$nick)]} { after 100 "RT_Queue_IRC $nick" } ; foreach hd_line [tmhb_main $nick [lindex $args 0]] {lappend RT_Kit(buffer,$nick) $hd_line};return 1}
  proc hd_pub {nick uhost hand chan args} { global tmhb RT_Kit ; tmhb_cs_irc ; if {![info exist RT_Kit(buffer,$chan)]} { after 100 "RT_Queue_IRC $chan" } ; foreach hd_line [tmhb_main $chan [lindex $args 0]] {lappend RT_Kit(buffer,$chan) $hd_line};return 1}
  proc hd_dcc {hand idx args}             { global tmhb ; tmhb_cs_irc ; foreach hd_line [tmhb_main $hand [lindex $args 0]] {putdcc $idx "$hd_line"};return 1}
}








eval "$tmhb(log) \"Alhamdolillah! Load Success.......$tmhb(name) $tmhb(version)\""



