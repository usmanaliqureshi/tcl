##################################################################
#         _    _        ___                  _			         #
#        ( )  ( )      |  _`\               ( )_		         #
#        `\`\/'/'  ___ | (_) )   _    _   _ | ,_)   __	         #
#          >  <  /',__)| ,  /  /'_`\ ( ) ( )| |   /'__`\         #
#         /'/\`\ \__, \| |\ \ ( (_) )| (_) || |_ (  ___/	     #
#        (_)  (_)(____/(_) (_)`\___/'`\___/'`\__)`\____)	     #
#										                         #
##################################################################
#										                         #
#       Official TCL Script For XsRoute Communications           #
#										                         #
##################################################################

set companychan "#XsRoute"

set ojn "XsRoute Communications - Ultimate Domain & Hosting Solutions"
set ojn2 "Check Out Our Website http://www.XsRoute.com -OR- Type !Help To See All The Commands"

bind join - * o_j_n

proc o_j_n {nick uhost hand chan} {
global companychan ojn ojn2
if {$chan == $companychan} {
putquick "NOTICE $nick :$ojn"
putquick "NOTICE $nick :$ojn2"
  }
}

#### E O N ####

##### Commands HELP !XsRoute ####

set h1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set h2 "The Available Commands :-"
set h3 "!Staff     - Shows the company staff information."
set h4 "!Web       - Shows the website link."
set h5 "!Reselller - Shows the link of our reseller packages."
set h6 "!Shells    - Shows the link of our available shell packages."
set h7 "!Vhosts    - Shows the link of our available vhosts."
set h8 "!Uptime    - Shows the server uptime."
set h9 "!Payments  - Shows About Payment Details"


bind pub - !Help st_help

proc st_help {nick uhost hand chan text} {
global companychan h1 h2 h3 h4 h5 h6 h7 h8 h9
if {$chan == $companychan} {
puthelp "NOTICE $nick :$h1"
puthelp "NOTICE $nick :$h2"
puthelp "NOTICE $nick :$h3"
puthelp "NOTICE $nick :$h4"
puthelp "NOTICE $nick :$h5"
puthelp "NOTICE $nick :$h6"
puthelp "NOTICE $nick :$h7"
puthelp "NOTICE $nick :$h8"
puthelp "NOTICE $nick :$h9"
  }
}

#### End Of Help Commands ####

#### Command STAFF !Staff ####

set s1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set s2 "The Staff :-"
set s3 "UsmanAli(Usman Ali Quraishi){Admin}<admin@xsroute.com>"
set s4 "Taimur(Taimur Hassan Kundi){Admin}<taimur@xsroute.com>"
set s5 "dEvILmINd(Muneeb){Admin}<devilmind@xsroute.com>"
set s6 "Note :- Please Respect The Staff. Thanks"

#################################
####### Info Of Usman Ali #######

set ua1 "Complete Information About UsmanAli"
set ua2 "Name :- Usman Ali Quraishi"
set ua3 "Living In :- Gujranwala Pakistan"
set ua4 "Status : Founder of XsRoute Communications"
set ua5 "Official email : admin@xsroute.com"
set ua6 "Online Timing : 1 PM to 5 PM & 10 PM to 1 AM"
set ua7 "End Of Information"

#################################
############ END ################

#################################
##### Info Of Taimur Hassan #####

set th1 "Complete Information About Taimur"
set th2 "Name :- Taimur Hassan"
set th3 "Living In :- Mianwali Pakistan"
set th4 "Status : Admin infact he is also a founder of XsRoute Communications With Usman Ali"
set th5 "Official email : admin@xsroute.com"
set th6 "Online Timing : 11 AM to 6 PM & 8 PM to 1 AM"
set th7 "End Of Information"

#################################
############ END ################

#################################
###### Info Of Muneeb Arif ######

set ma1 "Complete Information About Optiquest"
set ma2 "Name :- Muneeb Arif"
set ma3 "Living In :- Karachi Pakistan"
set ma4 "Status : Co-Admin"
set ma5 "Official email : muneebs@xsroute.com"
set ma6 "Online Timing : Not Define"
set ma7 "End Of Information"

#################################
############ END ################

set hi "Syntax : !info <nickname>"

bind pub - !Info st_info

proc st_info {nick uhost hand chan text} {
global companychan ua1 ua2 ua3 ua4 ua5 ua6 ua7 th1 th2 th3 th4 th5 th6 th7 ma1 ma2 ma3 ma4 ma5 ma6 ma7 hi
set sw [lindex $text 0]
if {$chan == $companychan} {
if {$sw == "UsmanAli"} {
puthelp "NOTICE $nick :$ua1"
puthelp "NOTICE $nick :$ua2"
puthelp "NOTICE $nick :$ua3"
puthelp "NOTICE $nick :$ua4"
puthelp "NOTICE $nick :$ua5"
puthelp "NOTICE $nick :$ua6"
puthelp "NOTICE $nick :$ua7"
} elseif {$sw == "Taimur"} {
puthelp "NOTICE $nick :$th1"
puthelp "NOTICE $nick :$th2"
puthelp "NOTICE $nick :$th3"
puthelp "NOTICE $nick :$th4"
puthelp "NOTICE $nick :$th5"
puthelp "NOTICE $nick :$th6"
puthelp "NOTICE $nick :$th7"
} elseif {$sw == "Optiquest"} {
puthelp "NOTICE $nick :$ma1"
puthelp "NOTICE $nick :$ma2"
puthelp "NOTICE $nick :$ma3"
puthelp "NOTICE $nick :$ma4"
puthelp "NOTICE $nick :$ma5"
puthelp "NOTICE $nick :$ma6"
puthelp "NOTICE $nick :$th7"
} else {
puthelp "NOTICE $nick :$hi"
    }
  }
}

bind pub - !Staff st_staff

proc st_staff {nick uhost hand chan text} {
global companychan s1 s2 s3 s4 s5 s6
if {$chan == $companychan} {
puthelp "NOTICE $nick :$s1"
puthelp "NOTICE $nick :$s2"
puthelp "NOTICE $nick :$s3"
puthelp "NOTICE $nick :$s4"
puthelp "NOTICE $nick :$s5"
puthelp "NOTICE $nick :$s6"
  }
}

#### End Of Staff ####

#### Command Web !Web or !Url ####


set w1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set w2 "Website Link :- http://www.xsroute.com"

bind pub - !web st_web

proc st_web {nick uhost hand chan text} {
global companychan w1 w2
if {$chan == $companychan} {
puthelp "NOTICE $nick :$w1"
puthelp "NOTICE $nick :$w2"
  }
}

bind pub - !Url st_url

proc st_url {nick uhost hand chan text} {
global companychan w1 w2
if {$chan == $companychan} {
puthelp "NOTICE $nick :$w1"
puthelp "NOTICE $nick :$w2"
  }
}

#### End Of Url Command ####

#### Command Reseller !Reseller ####

set rs1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set rs2 "Please visit the following link to see the reseller packages :-"
set rs3 "http://www.xsroute.com/irc-reseller.html"
set rs4 "Thanks For Having Interest To Become A Reseller Of XsRoute Communications."


bind pub - !Reseller st_reseller

proc st_reseller {nick uhost hand chan text} {
global companychan rs1 rs2 rs3 rs4
if {$chan == $companychan} {
puthelp "NOTICE $nick :$rs1"
puthelp "NOTICE $nick :$rs2"
puthelp "NOTICE $nick :$rs3"
puthelp "NOTICE $nick :$rs4"
  }
}

#### End Of Reseller ####

#### Command Shells !Shells ####

set sh1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set sh2 "Please visit the following link to see the shell hosting packages :-"
set sh3 "http://www.xsroute.com/unixshells.html"
set sh4 "Thanks For Choosing XsRoute Communications As Your Shell Hosting Provider."


bind pub - !Shells st_shells

proc st_shells {nick uhost hand chan text} {
global companychan sh1 sh2 sh3 sh4
if {$chan == $companychan} {
puthelp "NOTICE $nick :$sh1"
puthelp "NOTICE $nick :$sh2"
puthelp "NOTICE $nick :$sh3"
puthelp "NOTICE $nick :$sh4"
  }
}

#### End Of Shells ####

#### Command Vhosts !Vhosts ####

set vh1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set vh2 "Please visit the following link to see the vhosts of our servers :-"
set vh3 "http://www.xsroute.com/vhosts.html"
set vh4 "Thanks For Choosing XsRoute Communications As Your IRC Hosting Provider."


bind pub - !Vhosts st_vhosts

proc st_vhosts {nick uhost hand chan text} {
global companychan vh1 vh2 vh3 vh4
if {$chan == $companychan} {
puthelp "NOTICE $nick :$vh1"
puthelp "NOTICE $nick :$vh2"
puthelp "NOTICE $nick :$vh3"
puthelp "NOTICE $nick :$vh4"
  }
}

#### End Of Vhosts ####

#### Command Payments !Payments ####

set py1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set py2 "Dear Customers! We are only accepting payments via money order/bank transfer/cash in all over Pakistan. For international orders we accept payments via western union only or any other source like western union."
set py3 "Note :- We are NOT accepting payments via credit card or paypal."
set py4 "For Postal Details For Pakistani Customers Please Type --> !Pk"
set py5 "For International Customers Please Type --> !WU"
set py6 "Thanks"

set pk1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set pk2 "Dear Customers! You can send us money order on our postal details or you can made your payment via bank transfer/bank draft."
set pk3 "To Get Postal Details For Money Order Please Type --> !MO"
set pk4 "To Get Details Of Our Bank Account Please Type --> !Bank"
set pk5 "Thanks"

set mo1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set mo2 "Dear Customers! You can send us money order on our postal details given below :"
set mo3 "Name        : Usman Ali Quraishi"
set mo4 "Address     : Wahdat Colony Street No 7 House No 2 Gujranwala"
set mo5 "Postal Code : 52250"
set mo6 "Note :- This is 100 % correct postal address. If you will do any kind of writing mistake on the form of money order then this is your problem if the payment will not be received then company will not be responsible for it. So be carefull while writing the correct address."
set mo7 "Thanks For Choosing XsRoute Communications"

set bk1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set bk2 "Dear Customers! You can made your payment via bank trasnfer/bank draft on the details given below :"
set bk3 "Account Title  : Usman Ali"
set bk4 "Account Number : 8176"
set bk4 "Account Type   : PLS"
set bk5 "Bank Name      : Muslim Commercial Bank Sattelite Town Branch Gujranwala"
set bk6 "Branch Code    : 1311"
set bk7 "Note :- This is 100 % correct Bank Account Details. If you will do any kind of writing mistake on money transfer/bank draft form then this is your problem if the payment will not be received then company will not be responsible for it. So be carefull while writing the correct details of our bank account."
set bk8 "Thanks For You Choosing XsRoute Communications"

set wu1 "XsRoute Communications (Ultimate Domain & Hosting Solutions)"
set wu2 "Dear Customers! You can send us your payment via western union or via any other source of international money transfer/send on our postal details given below :"
set wu3 "Name        : Usman Ali Quraishi"
set wu4 "Address     : Wahdat Colony Street No 7 House No 3"
set wu5 "City        : Gujranwala"
set wu6 "Postal Code : 52250"
set wu7 "Country     : Pakistan"
set wu8 "Note :- This is 100 % correct postal address for international customers. If you will do any kind of writing mistake on the money sending form then this is your problem if the payment will not be received then company will not be responsible for it. So be carefull while writing the correct postal details."
set wu9 "Thanks For Choosing XsRoute Communications"

bind pub - !Pk st_pk

proc st_pk {nick uhost hand chan text} {
global companychan pk1 pk2 pk3 pk4 pk5
if {$chan == $companychan} {
puthelp "NOTICE $nick :$pk1"
puthelp "NOTICE $nick :$pk2"
puthelp "NOTICE $nick :$pk3"
puthelp "NOTICE $nick :$pk4"
puthelp "NOTICE $nick :$pk5"
  }
}

bind pub - !MO st_mo

proc st_mo {nick uhost hand chan text} {
global companychan mo1 mo2 mo3 mo4 mo5 mo6 mo7
if {$chan == $companychan} {
puthelp "NOTICE $nick :$mo1"
puthelp "NOTICE $nick :$mo2"
puthelp "NOTICE $nick :$mo3"
puthelp "NOTICE $nick :$mo4"
puthelp "NOTICE $nick :$mo5"
puthelp "NOTICE $nick :$mo6"
puthelp "NOTICE $nick :$mo7"
  }
}

bind pub - !Bank st_bank

proc st_bank {nick uhost hand chan text} {
global companychan bk1 bk2 bk3 bk4 bk5 bk6 bk7 bk8
if {$chan == $companychan} {
puthelp "NOTICE $nick :$bk1"
puthelp "NOTICE $nick :$bk2"
puthelp "NOTICE $nick :$bk3"
puthelp "NOTICE $nick :$bk4"
puthelp "NOTICE $nick :$bk5"
puthelp "NOTICE $nick :$bk6"
puthelp "NOTICE $nick :$bk7"
puthelp "NOTICE $nick :$bk8"
  }
}

bind pub - !WU st_wu

proc st_wu {nick uhost hand chan text} {
global companychan wu1 wu2 wu3 wu4 wu5 wu6 wu7 wu8 wu9
if {$chan == $companychan} {
puthelp "NOTICE $nick :$wu1"
puthelp "NOTICE $nick :$wu2"
puthelp "NOTICE $nick :$wu3"
puthelp "NOTICE $nick :$wu4"
puthelp "NOTICE $nick :$wu5"
puthelp "NOTICE $nick :$wu6"
puthelp "NOTICE $nick :$wu7"
puthelp "NOTICE $nick :$wu8"
puthelp "NOTICE $nick :$wu9"
  }
}

bind pub - !Payments st_payments

proc st_payments {nick uhost hand chan text} {
global companychan py1 py2 py3 py4 py5 py6
if {$chan == $companychan} {
puthelp "NOTICE $nick :$py1"
puthelp "NOTICE $nick :$py2"
puthelp "NOTICE $nick :$py3"
puthelp "NOTICE $nick :$py4"
puthelp "NOTICE $nick :$py5"
puthelp "NOTICE $nick :$py6"
  }
}

#### End Of Payments ####

############################################################
putlog "Official TCL XsRoute.tcl By UsmanAli"             ;#
putlog "Loading." ;#########################################
putlog "Loading.." ;########################################
putlog "Loading..." ;#######################################
putlog "Loading...." ;######################################
putlog "Loading.....DONE" ;#################################
############################################################
