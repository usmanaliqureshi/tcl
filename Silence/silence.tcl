 bind pub n|- \+silence do:silence
 bind pub n|- \-silence do:unsil
 proc do:silence {n h d c t} {
 putserv "PRIVMSG $c :Setting SILENCE mode..."
 putserv "silence +*!*@*"
 }
 proc do:unsil {n h d c t} {
 putserv "PRIVMSG $c :Removing SILENCE mode..."
 putserv "silence -*!*@*"
 }

putlog "silence tcl loaded"