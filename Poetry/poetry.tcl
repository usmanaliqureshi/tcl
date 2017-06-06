
##### GENERAL SETTINGS ####
# EDIT the channel names or REMOVE one or two depending on which channel you intend the bot the advertise
set channel "#Channel"

# Edit the time cycle which is in minutes format depending on the time intervals you want the bot to flow out the advertisment
set time 1

# EDIT the text or REMOVE or ADD lines including inverted commas at the starting and ending at each line 
set poetry {
 "testing poetry tcl"
 "testing poetry tcl by behropia"
 "testing poetry tcl by shahensha"
}
##### DO NOT EDIT ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING #####

if {[string compare [string index $time 0] "!"] == 0} { set timer [string range $time 1 end] } { set timer [expr $time * 60] }
if {[lsearch -glob [utimers] "* go *"] == -1} { utimer $timer go }

proc go {args} {
global channel time text timer
foreach chan $channel {
putact $chan "[do_randompoet $args]"
}
if {[lsearch -glob [utimers] "* go *"] == -1} { utimer $timer go }
} 

proc do_randompoet {nick} {
   global poetry
   set output1 [lindex $poetry [rand [llength $poetry]]]
   return "$output1" 

}
putlog "\002poetry tcl script for Behropia by Shahensha\002"