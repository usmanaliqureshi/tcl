proc tmqb_save {} {
  global tmqb botnet-nick
  if {[file exist $tmqb(root)/quran-save.${botnet-nick}]} {
    if {[file exist $tmqb(root)/quran-save.${botnet-nick}.bak]} { file delete $tmqb(root)/quran-save.${botnet-nick}.bak }
    file rename $tmqb(root)/quran-save.${botnet-nick} $tmqb(root)/quran-save.${botnet-nick}.bak
  }

  set mq_file [open $tmqb(root)/quran-save.${botnet-nick}.wri w]

  puts $mq_file "saved_data 1"

  for { set mq_cnt 0 } { $mq_cnt <= [llength [array get tmqb]] } {incr mq_cnt 2} {
    if {[string match last,* [lindex [array get tmqb] $mq_cnt]] || [string match tran,* [lindex [array get tmqb] $mq_cnt]]} {
      append mq_wri "[lindex [array get tmqb] $mq_cnt] [lindex [array get tmqb] [expr $mq_cnt+1]]\n"
    }
  }

  puts $mq_file $mq_wri
  close $mq_file
  file rename $tmqb(root)/quran-save.${botnet-nick}.wri $tmqb(root)/quran-save.${botnet-nick}


  after 1000000 tmqb_save
  return 1
}



proc tmqb_load {} {
  global tmqb botnet-nick
  if {[info exists tmqb(saved_data)]} { return "Data Already loaded. Skipping" }

  if {![file exist $tmqb(root)/quran-save.${botnet-nick}]} {
    if {[file exist $tmqb(root)/quran-save.${botnet-nick}.bak]} {
      set mq_file [open $tmqb(root)/quran-save.${botnet-nick}.bak]
    } {
      after 1000000 tmqb_save
      return "$tmqb(root)/quran-save.${botnet-nick} not Found."
    }
  } {
    set mq_file [open $tmqb(root)/quran-save.${botnet-nick}]
  }

  while {![eof $mq_file]} {
    set mq_line [gets $mq_file]
    set tmqb([lindex $mq_line 0]) [lindex $mq_line 1]
  }

  close  $mq_file
  after 1000000 tmqb_save
  return 1
}
tmqb_load

