##################################################################################
#---------> Allah The Almighty is the Only God Of This Universe <----------------#
##################################################################################

##################################################################################
#                     									         				 #
# Author Nickname :- 										   					 #
#        UsmanAli @ UnderNet , DALnet , Quakenet					   			 #
# Author Name :-											   					 #
#        Usman Ali Quraishi									   					 #
# Author Emails :-										   						 #
#		ssal433 @ hotmail.com								   					 #
#		usmanaliquraishi @ yahoo.com							   				 #
# Script Completed On :-									   					 #
#	   10 July 2006										   						 #
# Script Version :-										   						 #
#         v2.0											   						 #
#                     									         				 #
##################################################################################

##################################################################################
#                     									         				 #
#                     Public Channel & User Commands                             #
# Description :- 											   					 #
#     This script will help you to do anything without getting in the partyline. #
# I have added many commands which are very usefull which are usefull for a chan #
# May be you think these commands are ordinary commands which are in any script  #
# but I never find a script which have all commands which needed oftenly in      #
# channel.So I made this script which has no any bug I have tested it in my own  #
# eggdrop,but if you find any bug or error in this TCL Script you can mail me    #
# with the bug or error you will find on this email address listed in my intro   #
# section.												   						 #
#                     									         				 #
##################################################################################
#                     									         				 #
#    		    -: How I Become A TCL Script Writter :-                          #
#      I was started using these psybncs , eggdrops , emechs stuff in the 2004   #
#  I was a little poor in programming. I didn't know any programming language    #
#  & dull in IRC but was interested in IRC stuff whole heartidly.As far as       #
#  I remember when I connected my first eggdrop on undernet I was really very    #
#  happy.After learning how to connect an eggdrop the next step was how to       #
#  put scripts in it.I used to ask too many stupid question to the people        #
#  but I never found a good answer.But some IRC friends helped me to grow up     #
#  in this stuff.As I remember their nicks are Guvnor , Donar , _`_ , Baadshah   #
#  a romanian guy I don't remember his nick , Taimur , Rana^Usman.All these      #
#  guys were my old friends,I don't know if they remember me or not but I still  #
#  remember them.As I remember Guvnor was the operator of #karachi when I joined #
#  UnderNet.He used to stay in #eggdrop channel I saw him many times in that     #
#  channel.Donar was a good eggdrop n tcl master was the admin of #lahore on     #
#  UnderNet.Guvnor & Donar never answered me with complete devotion but they     #
#  used to give me hints to do this to do that so in this way I learn scripting  #
#  myself but if they didn't tell me some hints then how I could be this which   #
#  is I am now._`_ was a very good friend of mine his name is Khurram.He was     #
#  the admin of #pakistan.He teached me better than Guvnor & Donar.Whenever I    #
#  ask any question to _`_ he answered me with devotion and with kindness.He     #
#  was a great person as far as I remember I asked first time a question to      #
#  _`_ about how to add a command in the eggdrop to +x after login than he       #
#  made a little but usefull script for me which was very usefull for me.        #
#  I used to buy shells from Baadshah which was a shell provider owned a         #
#  shell company named as Super Shells.So he teached me good & better things.    #
#  A romanian guy used to teach me alot like how to add a script in an eggdrop   #
#  & how to put the source in .conf file.Taimur was a student of mine in this    #
#  stuff but he knows too many things about servers & eggdroping so now you      #
#  can say I am junior than him in managing a server of hosting.Taimur is        #
#  like a little brother for me.He is still with me & I hope he will be with     #
#  me forever.^Rana^Usman was also a good friend of mine we both used to make    #
#  eggdrops & used to learn so many things together.He is also a TCL Script      #
#  writter now.You can find & download his scripts from http://www.egghelp.com   #
#  This is all my story that how I become a tcl script writter.Thanks to Every   #
#  body which helped me to become UsmanAli(as TCL Script Writter).               #
#    													   						 #
##################################################################################
#                     									         				 #
# Important Notice :-										   					 #
#	I am feeling happy to announce that this is the second version of my tcl   	 #
# script named as pcucommands.tcl.For Updates Read The Updates Section and also  #
# check if you are one of the user which requested for new commands/updates.If   #
# you want to request for some command which is usefull you can email me at my   #
# email address. I will be waiting for your requests and suggestions. You can    #
# also report for bugs/errors on my email address.I hope you will like this      #
# script. 												   						 #
# 					Thanks/Regards						   						 #
#                     									         				 #
##################################################################################
# 													   							 #
# Errors/Requests :-										   					 #
#													   							 #
# By nick \ Changes										   						 #
#													   							 #
# Taimur \ He found some errors in the adduser , deluser commands successfully   #
#		fixed.He also helped me alot.							   				 #
#													   							 #
# ******* \ He requested to update help section and also request to convert the   #
# 		 help section to /msg's syntax instead of main channel command which 	 #
#		 was !help.										   						 #
#													   							 #
# Billo \ She found and requested to update addowner/addop errors/restrictions   #
#													   							 #
#													   							 #
#  ****************************								   					 #
#  #- Help Section Completed -#								   					 #
#  ****************************								   					 #
#													   							 #
#     I have completed the help section and also convert it to /msg syntax.Now   #
# you can see all the commands or some specified command by doing the following  #
#													   							 #
# /msg bot pcuhelp 										   						 #
#													   							 #
# /msg bot pcuhelp <command> 									   				 #
#													   							 #
# and you will get help with full syntax and description.				   		 #
# 													   							 #
# ************************									   					 #
# #- Restrictions Added -#									   					 #
# ************************								         				 #
#													   							 #
#    Restrictions has been successfully added in adduser/chattr/deluser/addop/   #
# /addowner commands.Now the channel op can't add/modify a user for global flags #
# and no channel master/owner can add a user with global flags.	   		    	 #
# 													   							 #
##################################################################################


###########################################################################
#============================== BINDS ====================================#
#  Don't Edit Below If You Don't Know Tool Command Language(TCL) Thanks   #
###########################################################################

###############
# - OP/DEOP - #
###############

bind pub o|o !op op
bind pub o|o .op op
bind pub o|o -op op
bind pub o|o !o op
bind pub o|o .o op
bind pub o|o -o op
bind pub o|o !up op
bind pub o|o .up op
bind pub o|o -up op
bind pub o|o !deop deop
bind pub o|o .deop deop
bind pub o|o -deop deop
bind pub o|o .-o deop
bind pub o|o !do deop
bind pub o|o .do deop
bind pub o|o -do deop
bind pub o|o !down deop
bind pub o|o .down deop
bind pub o|o -down deop

#EOB

#####################
# - VOICE DEVOICE - #
#####################

bind pub o|o !voice voice
bind pub o|o .voice voice
bind pub o|o -voice voice
bind pub o|o !v voice
bind pub o|o .v voice
bind pub o|o -v voice
bind pub o|o !devoice devoice
bind pub o|o .devoice devoice
bind pub o|o -devoice devoice
bind pub o|o !dev devoice
bind pub o|o .dev devoice
bind pub o|o -dev devoice


#EOB

############
# - KICK - #
############

bind pub o|o !kick kick
bind pub o|o .kick kick
bind pub o|o -kick kick
bind pub o|o !k kick
bind pub o|o .k kick
bind pub o|o -k kick

#EOB

#################
# - BAN/UNBAN - #
#################

bind pub o|o !ban ban
bind pub o|o .ban ban
bind pub o|o -ban ban
bind pub o|o !kb ban
bind pub o|o .kb ban
bind pub o|o -kb ban
bind pub o|o !b ban
bind pub o|o .b ban
bind pub o|o -b ban
bind pub o|o !gban gban
bind pub o|o .gban gban
bind pub o|o -gban gban
bind pub o|o !gb gban
bind pub o|o .gb gban
bind pub o|o -gb gban
bind pub o|o !unban unban
bind pub o|o .unban unban
bind pub o|o -unban unban
bind pub o|o !ub unban
bind pub o|o .ub unban
bind pub o|o -ub unban
bind pub o|o !gunban gunban
bind pub o|o .gunban gunban
bind pub o|o -gunban gunban
bind pub o|o !gub gunban
bind pub o|o .gub gunban
bind pub o|o -gub gunban
bind pub o|o !bans bans_chan
bind pub o|o .bans bans_chan
bind pub o|o -bans bans_chan


#############################################################
# - ADDUSER/DELUSER/ADDOP/ADDOWNER/CHATTR/ADDHOST/DELHOST - #
#############################################################

bind pub m|m !addacc add_user
bind pub m|m .addacc add_user
bind pub m|m -addacc add_user
bind pub m|m !addowner add_owner_chan
bind pub m|m .addowner add_owner_chan
bind pub m|m -addowner add_owner_chan
bind pub m|m !addop add_op_chan
bind pub m|m .addop add_op_chan
bind pub m|m -addop add_op_chan
bind pub m|m !deluser del_user
bind pub m|m .deluser del_user
bind pub m|m -deluser del_user
bind pub m|m !chattr chattr_global
bind pub m|m .chattr chattr_global
bind pub m|m -chattr chattr_global
bind pub m|m !addhost add_host
bind pub m|m .addhost add_host
bind pub m|m -addhost add_host
bind pub m|m !delhost del_host
bind pub m|m .delhost del_host
bind pub m|m -delhost del_host


#######################
# - ADDCHAN/DELCHAN - #
#######################

bind pub m|m !addchan add_chan
bind pub m|m .addchan add_chan
bind pub m|m -addchan add_chan
bind pub m|m !delchan del_chan
bind pub m|m .delchan del_chan
bind pub m|m -delchan del_chan
bind pub m|m !chanset chan_set
bind pub m|m .chanset chan_set
bind pub m|m -chanset chan_set


##########################
# - REHASH/RESTART/DIE - #
##########################

bind pub m|m !rehash r_hash
bind pub m|m .rehash r_hash
bind pub m|m -rehash r_hash
bind pub n|n !restart r_start
bind pub n|n .restart r_start
bind pub n|n -restart r_start
bind pub n|n !die d_i_e
bind pub n|n .die d_i_e
bind pub n|n -die d_i_e


#############
# - TOPIC - #
#############

bind pub o|o !topic topic
bind pub o|o .topic topic
bind pub o|o -topic topic
bind pub o|o !t topic
bind pub o|o .t topic
bind pub o|o -t topic


############
# - HELP - #
############

bind msg o|o pcuhelp p_c_u_help

###########################################################################
#=========================== END OF BINDS ================================#
###########################################################################

#-------------------------------------------------------------------------#

###########################################################################
#========================= PUBLIC COMMANDS ===============================#
###########################################################################

###############
# - OP/DEOP - #
###############

proc op {nick host hand chan text} {
set optext1 [lrange $text 0 5]
set optext2 [lrange $text 6 11]
set optext3 [lrange $text 12 17]
set optext4 [lrange $text 18 23]
set optext5 [lrange $text 24 29]
set optext6 [lrange $text 30 35]
set optext7 [lrange $text 36 41]
set optext8 [lrange $text 42 47]
if {![botisop $chan]} {
putquick "NOTICE $nick :I am not opped in $chan"
return 0
}
if {$optext1 == ""} {
putquick "MODE $chan +o $nick"
  } else {
putserv "MODE $chan +oooooo $optext1"
putserv "MODE $chan +oooooo $optext2"
putserv "MODE $chan +oooooo $optext3"
putserv "MODE $chan +oooooo $optext4"
putserv "MODE $chan +oooooo $optext5"
putserv "MODE $chan +oooooo $optext6"
putserv "MODE $chan +oooooo $optext7"
putserv "MODE $chan +oooooo $optext8"
  }
}

proc deop {nick host hand chan text} {
global botnick
set deoptext1 [lindex $text 0]
set userhost [getchanhost $deoptext1]
if {$deoptext1 == ""} {
putquick "MODE $chan -o $nick"
  } elseif {[matchattr [nick2hand $deoptext1] n]} {
putquick "NOTICE $nick :Sorry,you cann't deop $deoptext1 ($deoptext1!$userhost is an Official Bot Manager & Bot Administrator & Global Operator & logged in as [nick2hand $deoptext1])"
  } elseif {[matchattr [nick2hand $deoptext1] m]} {
putquick "NOTICE $nick :Sorry,you cann't deop $deoptext1 ($deoptext1!$userhost is an Official Bot Administrator & Global Operator & logged in as [nick2hand $deoptext1])"
  } elseif {[matchattr [nick2hand $deoptext1] |+n $chan]} {
putquick "NOTICE $nick :Sorry,you cann't deop $deoptext1 ($deoptext1!$userhost is an Official $chan Manager & logged in as [nick2hand $deoptext1])"
  } elseif {[matchattr [nick2hand $deoptext1] |+m $chan]} {
putquick "NOTICE $nick :Sorry,you cann't deop $deoptext1 ($deoptext1!$userhost is an Official $chan Administrator & logged in as [nick2hand $deoptext1])"
  } else {
putserv "MODE $chan -o $deoptext1"
  }
}

#EOP

#####################
# - VOICE/DEVOICE - #
#####################

proc voice {nick host hand chan text} {
set vtext1 [lrange $text 0 5]
set vtext2 [lrange $text 6 11]
set vtext3 [lrange $text 12 17]
set vtext4 [lrange $text 18 23]
set vtext5 [lrange $text 24 29]
set vtext6 [lrange $text 30 35]
set vtext7 [lrange $text 36 41]
set vtext8 [lrange $text 42 47]
if {$vtext1 == ""} {
putquick "MODE $chan +v $nick"
  } else {
putserv "MODE $chan +vvvvvv $vtext1"
putserv "MODE $chan +vvvvvv $vtext2"
putserv "MODE $chan +vvvvvv $vtext3"
putserv "MODE $chan +vvvvvv $vtext4"
putserv "MODE $chan +vvvvvv $vtext5"
putserv "MODE $chan +vvvvvv $vtext6"
putserv "MODE $chan +vvvvvv $vtext7"
putserv "MODE $chan +vvvvvv $vtext8"
  }
}

proc devoice {nick host hand chan text} {
set dvtext1 [lrange $text 0 5]
set dvtext2 [lrange $text 6 11]
set dvtext3 [lrange $text 12 17]
set dvtext4 [lrange $text 18 23]
set dvtext5 [lrange $text 24 29]
set dvtext6 [lrange $text 30 35]
set dvtext7 [lrange $text 36 41]
set dvtext8 [lrange $text 42 47]
if {$dvtext1 == ""} {
putquick "MODE $chan -v $nick"
  } else {
putserv "MODE $chan -vvvvvv $dvtext1"
putserv "MODE $chan -vvvvvv $dvtext2"
putserv "MODE $chan -vvvvvv $dvtext3"
putserv "MODE $chan -vvvvvv $dvtext4"
putserv "MODE $chan -vvvvvv $dvtext5"
putserv "MODE $chan -vvvvvv $dvtext6"
putserv "MODE $chan -vvvvvv $dvtext7"
putserv "MODE $chan -vvvvvv $dvtext8"
  }
}

#EOP

############
# - KICK - #
############

proc kick {nick host hand chan text} {
set kicknick [lindex $text 0]
set kickreason [lrange $text 1 end]
set userhost [getchanhost $kicknick]
if {$kickreason == ""} {
putquick "NOTICE $nick :.kick <nick> <reason>"
  } elseif {[matchattr [nick2hand $kicknick] n]} {
putquick "NOTICE $nick :Sorry,you cann't kick $kicknick ($kicknick!$userhost is an Official Bot Manager & Bot Administrator & Global Operator & logged in as [nick2hand $kicknick])"
  } elseif {[matchattr [nick2hand $kicknick] m]} {
putquick "NOTICE $nick :Sorry,you cann't kick $kicknick ($kicknick!$userhost is an Official Bot Administrator & Global Operator & logged in as [nick2hand $kicknick])"
  } elseif {[matchattr [nick2hand $kicknick] |+n $chan]} {
putquick "NOTICE $nick :Sorry,you cann't kick $kicknick ($kicknick!$userhost is an Official $chan Manager & logged in as [nick2hand $kicknick])"
  } elseif {[matchattr [nick2hand $kicknick] |+m $chan]} {
putquick "NOTICE $nick :Sorry,you cann't kick $kicknick ($kicknick!$userhost is an Official $chan Administrator & logged in as [nick2hand $kicknick])"
  } else {
putquick "KICK $chan $kicknick :[clock format [clock seconds] -format "%a %d %b %Y"] - $kickreason"
  }
}
#EOP

#################
# - BAN/UNBAN - #
#################

proc ban {nick host hand chan text} {
set bannick [lindex $text 0]
set banreason [lrange $text 1 end]
set bhost "*!*@[lindex [split [getchanhost $bannick $chan] @] 1]"
if {$banreason == ""} {
putquick "NOTICE $nick :.ban <nick> <reason>"
  } elseif {[matchattr [nick2hand $bannick] n]} {
putquick "NOTICE $nick :Sorry,you cann't kick $bannick ($bannick!$userhost is an Official Bot Manager & Bot Administrator & Global Operator & logged in as [nick2hand $bannick])"
  } elseif {[matchattr [nick2hand $bannick] m]} {
putquick "NOTICE $nick :Sorry,you cann't kick $bannick ($bannick!$userhost is an Official Bot Administrator & Global Operator & logged in as [nick2hand $bannick])"
  } elseif {[matchattr [nick2hand $bannick] |+n $chan]} {
putquick "NOTICE $nick :Sorry,you cann't kick $bannick ($bannick!$userhost is an Official $chan Manager & logged in as [nick2hand $bannick])"
  } elseif {[matchattr [nick2hand $bannick] |+m $chan]} {
putquick "NOTICE $nick :Sorry,you cann't kick $bannick ($bannick!$userhost is an Official $chan Administrator & logged in as [nick2hand $bannick])"
  } else {
putquick "MODE $chan +b $bhost"
putquick "KICK $chan $bannick :[clock format [clock seconds] -format "%a %d %b %Y"] - $banreason"
  }
}

proc unban {nick host hand chan text} {
set ubantext [lrange $text 0 end]
if {$ubantext == ""} {
putquick "NOTICE $nick :The Banmask is not in the channel banlist"
  } else {
putquick "MODE $chan -b $ubantext"
  }
}

proc gban {nick host hand chan text} {
set gbannick [lindex $text 0]
set gbantime [lindex $text 1]
set gbanreason [lrange $text 2 end]
set userhost "*!*@[lindex [split [getchanhost $gbannick $chan] @] 1]"
set bhost "$gbannick![getchanhost $gbannick $chan]"
if {$userhost == ""} {
putquick "NOTICE $nick :.gban <nick> <duration in minutes> <reason>"
  } elseif {$gbanreason == ""} {
putquick "NOTICE $nick :.gban <nick> <duration in minutes> <reason>"
  } elseif {[matchattr $gbannick n|-] == 1} {
putquick "NOTICE $nick :Sorry,you cann't kick $gbannick ($gbannick!$userhost is an Official Bot Developer & Bot Administrator & Global Operator & logged in as $gbannick)"
  } elseif {[matchattr $gbannick m|-] == 1} {
putquick "NOTICE $nick :Sorry,you cann't kick $gbannick ($gbannick!$userhost is an Official Bot Administrator & Global Operator & logged in as $gbannick)"
  } else {
newchanban $chan $userhost $nick $gbanreason $gbantime sticky
  }
}

proc gunban {nick host hand chan text} {
set gubantext [lrange $text 0 end]
if {$gubantext == ""} {
putquick "NOTICE $nick :.gunban <nick|host>"
  } else {
killchanban $chan $gubantext
  }
}

proc bans_chan {nick uhost hand chan text} {  
     puthelp "NOTICE $nick :- \037\002Ban List for\002\037 ($chan.)"  
foreach {a b c d} [banlist $chan] {  
     puthelp "NOTICE $nick :- [format %-12s%-12s%-12s%-12s $a $b $c $d]" 
     } 
     puthelp "NOTICE $nick :- \037\002Ban List for\002\037 ($chan Completed.)" 
}

#EOP

#############################################################
# - ADDUSER/DELUSER/ADDOP/ADDOWNER/CHATTR/ADDHOST/DELHOST - #
#############################################################

proc add_user {n u h c a} {
  global botnick

  set newop [lindex $a 0]
  set newhost [maskhost [getchanhost $newop $c]]

  if {$newop == ""} {
	putquick "NOTICE $n : .adduser <nick> <flags>"
	putquick "NOTICE $n :Flags: n(owner), m (master), f (friend)"
      return 0
  } elseif {![matchattr [nick2hand $n] A]} {
  putquick "NOTICE $n :Sorry,you have Insufficient privileges to perform this command."
  } elseif {[validuser [nick2hand $newop]]} {
  putquick "NOTICE $n :$newop is already exist as [nick2hand $newop]"
  } else {
  adduser $newop $newhost
  chattr $newop +H-hp
  putserv "NOTICE $n :$newop\[$newhost\] has been added"
  putserv "NOTICE $newop :Congradulations $newop!"
  putserv "NOTICE $newop :$n has added you"
  putserv "NOTICE $newop :Please set a password: /msg $botnick pass <password>"
  putserv "NOTICE $newop :where <password> is your selected password."
  putserv "NOTICE $newop :You can get ops by: /msg $botnick op <password>"
  save
  }
}

proc add_owner_chan {n u h c a} {
  global botnick
  if {[lindex $a 0] == ""} {
	putquick "NOTICE $n : .addowner <nick>"
      return 0
  } 

  set newop [lindex $a 0]
  set newhost [maskhost [getchanhost $newop $c]]

  if {[validuser $newop] == 1} {
     if {[lsearch [getuser $newop hosts] $newhost] == "-1"} {
       putserv "NOTICE $n :$newop exists in my database."
     return 1
     } {
     putserv "NOTICE $n :$newop exists in my database."
     return 1 }
  }  

  if {[finduser $newhost] != "*"} { 
	putserv "NOTICE $n :$newop\[$newhost\] is known as user [finduser $newhost]"
 	return 1
  }
 
  adduser $newop $newhost
  chattr $newop |+mnof $c
  putserv "NOTICE $n :$newop\[$newhost\] has been added in $c as owner"
  putserv "NOTICE $newop :Congradulations $newop!"
  putserv "NOTICE $newop :$n has added you in $c as owner"
  putserv "NOTICE $newop :Please set a password: /msg $botnick pass <password>"
  putserv "NOTICE $newop :where <password> is your selected password."
  putserv "NOTICE $newop :You can get ops by: /msg $botnick op <password>"
  save
}

proc add_op_chan {n u h c a} {
  global botnick
  if {[lindex $a 0] == ""} {
	putquick "NOTICE $n : .addop <nick>"
      return 0
  } 

  set newop [lindex $a 0]
  set newhost [maskhost [getchanhost $newop $c]]

  if {[validuser $newop] == 1} {
     if {[lsearch [getuser $newop hosts] $newhost] == "-1"} {
       putserv "NOTICE $n :$newop exists in my database."
     return 1
     } {
     putserv "NOTICE $n :$newop exists in my database."
     return 1 }
  }  

  if {[finduser $newhost] != "*"} { 
	putserv "NOTICE $n :$newop\[$newhost\] is known as user [finduser $newhost]"
 	return 1
  }
 
  adduser $newop $newhost
  chattr $newop |+of $c

  putserv "NOTICE $n :$newop\[$newhost\] has been added in $c as operator"
  putserv "NOTICE $newop :Congradulations $newop!"
  putserv "NOTICE $newop :$n has added you in $c as operator"
  putserv "NOTICE $newop :Please set a password: /msg $botnick pass <password>"
  putserv "NOTICE $newop :where <password> is your selected password."
  putserv "NOTICE $newop :You can get ops by: /msg $botnick op <password>"
  save
}


proc del_user {n u h c a} {
  global botnick
  if {[lindex $a 0] == ""} {
	putquick "NOTICE $n : .deluser <nick>"
      return 0
  } 
  set newop [lindex $a 0]
  set newhost [maskhost [getchanhost $newop $c]]

  if {[validuser $newop] == 1} {
     if {[lsearch [getuser $newop hosts] $newhost] == "-1"} {
       putserv "NOTICE $n :$newop exists in my database.Deleting The Requested User From Userlist"
     	 deluser $newop
       return 1
     } {
     putserv "NOTICE $n :$newop is in my database.Deleting Requested User From Userlist."
     deluser $newop
     return 1
     }
  }  
  deluser $newop
  save
}

proc chattr_global {n u h c a} {
  global botnick
  set newflags [lindex $a 1]
  if {[lindex $a 0] == ""} {
	putquick "NOTICE $n : .chattr <nick> <flags>"
      return 0
  } 
  if {[lindex $a 1] == ""} {
     	putquick "NOTICE $n : .chattr <nick> <flags>"
      return 0
  }
  set newop [lindex $a 0]
  set newhost [maskhost [getchanhost $newop $c]]

  if {![matchattr [nick2hand $n] m|- $c] || ![matchattr $n m|- $c]} {
     putserv "NOTICE $n :Sorry! You must be global owner/master to use this command."
     return 0
     }

  if {[validuser $newop] == 1} {
     if {[lsearch [getuser $newop hosts] $newhost] == "-1"} {
       putserv "NOTICE $n :$newop exists in my database. Upgrading flags of $newop"
       chattr $newop -|$newflags
       return 1
     }
  }  
  
  if {[chattr $newop $newflags] == "*"} {
  	putserv "NOTICE $n :Error Upgrading flags to $newop.Because $newop don't exist in my database."
	return 1
  }
}

proc add_host {n u h c a} {
set existuser [lindex $a 0]
set userhost [lindex $a 1]
  if {$existuser == ""} {
	putquick "NOTICE $n : .addhost <nick> <host>"
	return 0
} elseif {$userhost == ""} {
	putquick "NOTICE $n : .addhost <nick> <host>"
	return 0
}

  if {[validuser $existuser] == 1} {
	setuser $existuser HOSTS $userhost
	return 1
  }
}

proc del_host {n u h c a} {
set existuser [lindex $a 0]
set userhost [lindex $a 1]
  if {$existuser == ""} {
	putquick "NOTICE $n : .delhost <nick> <host>"
	return 0
} elseif {$userhost == ""} {
	putquick "NOTICE $n : .delhost <nick> <host>"
	return 0
}
  if {[validuser $existuser] == 1} {
	delhost $existuser $userhost
	return 1
  }
}

#EOP

###############################
# - ADDCHAN/DELCHAN/CHANSET - #
###############################

proc add_chan {n u h c a} {
  global botnick
  set newchan [lindex $a 0]
  if {[lindex $a 0] == ""} {
	putquick "NOTICE $n : .addchan #Channel"
      return 0
      } else { 
	channel add $newchan {+greet -bitch +autoop -bitch -stopnethack}
  }
}

proc del_chan {n u h c a} {
  set oldchan [lindex $a 0]
  if {[lindex $a 0] == ""} {
	putquick "NOTICE $n : .addchan #Channel"
      return 0
      } else { 
	channel remove $oldchan
  }
}

proc chan_set {n u h c a} {
set chanmode [lindex $a 0]
set chansetting [lrange $a 1 end]

  if {$chanmode == ""} {
  putquick  "NOTICE $n : .chanset <chanmode> <args>"
  putquick "NOTICE $n :Example : .chanset chanmode +s | .chanset +autoop"
  return 0
}
  channel set $c $chanmode $chansetting
}

#EOP

##########################
# - REHASH|RESTART|DIE - #
##########################

proc r_hash {n u h c a} {
  global rehash
  putquick "NOTICE $n :Rehashing ... -= DONE =-"
  rehash
}

proc r_start {n u h c a} {
  global restart
  putquick "NOTICE $n :Restarting ..."
  restart
}

 proc d_i_e {n u h c a} {
  global die
  set diereason [lrange $a 0 end]
  if {$diereason == ""} {
  die $n
  } else {
  die $n:($diereason)
  }
}

#EOP

#############
# - TOPIC - #
#############

proc topic {nick host hand chan text} {
set topictext [lrange $text 0 end]
if {$topictext == ""} {
putquick "NOTICE $nick :.topic <topic text here>"
} elseif {![botisop $chan]} {
putquick "NOTICE $nick :I am not opped in $chan"
  } else {
putquick "TOPIC $chan :$topictext"
  }
}

#EOP

############
# - HELP - #
############

proc p_c_u_help {nick host hand text} {
global botnick
set htext [lindex $text 0]
if {$htext == "op"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!op\002 or \002!op <nick>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!up\002 , \002!o\002"
} elseif {$htext == "deop"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!deop\002 or \002!deop <nick>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!down\002 , \002!do\002"
} elseif {$htext == "voice"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!voice\002 or \002!voice <nick>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!v\002"
} elseif {$htext == "devoice"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!devoice\002 or \002!devoice <nick>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!dev\002"
} elseif {$htext == "kick"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!kick <nick> <reason>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!k <nick> <reason>\002"
} elseif {$htext == "ban"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!ban <nick> <reason>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!b <nick> <reason>\002"
} elseif {$htext == "gban"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!gban <nick> <reason>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!gb <nick> <reason>\002"
puthelp "PRIVMSG $nick :Add a ban for a specified user in the $botnick's banlist."
} elseif {$htext == "gunban"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!gunban <hostmask>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!gub <hostmask>\002"
puthelp "PRIVMSG $nick :Remove a ban from $botnick's banlist."
} elseif {$htext == "bans"} {
puthelp "PRIVMSG $nick :This command can be used by channel/global operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!bans\002"
puthelp "PRIVMSG $nick :Show the bans of the channel."
} elseif {$htext == "adduser"} {
puthelp "PRIVMSG $nick :This command can be used by global masters/owners :"
puthelp "PRIVMSG $nick :\002!adduser <nick>\002"
} elseif {$htext == "addop"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel masters/owners only :"
puthelp "PRIVMSG $nick :\002!addop <nick>\002"
puthelp "PRIVMSG $nick :Add a user in a channel as operator(+of) flags not with global flags."
} elseif {$htext == "addowner"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel masters/owners only :"
puthelp "PRIVMSG $nick :\002!addowner <nick>\002"
puthelp "PRIVMSG $nick :Add a user in a channel as master/owner(+mnof) flags not with global flags."
} elseif {$htext == "deluser"} {
puthelp "PRIVMSG $nick :This command can be used by global masters/owners only :"
puthelp "PRIVMSG $nick :\002!deluser <nick>\002"
puthelp "PRIVMSG $nick :Delete a specified user from $botnick's userlist."
} elseif {$htext == "chattr"} {
puthelp "PRIVMSG $nick :This command can be used by global masters/owners only :"
puthelp "PRIVMSG $nick :\002!chattr <nick> <flags>\002"
puthelp "PRIVMSG $nick :n = owner , m = master , o = operator , f = friend"
puthelp "PRIVMSG $nick :Upgrade a specified user's flag in $botnick's userlist."
} elseif {$htext == "addhost"} {
puthelp "PRIVMSG $nick :This command can be used by all users exists in the $botnick's userlist :"
puthelp "PRIVMSG $nick :\002!addhost <nick> <hostmask>\002"
puthelp "PRIVMSG $nick :Add specified hostmask for a specified user."
} elseif {$htext == "delhost"} {
puthelp "PRIVMSG $nick :This command can be used by all users exists in the $botnick's userlist :"
puthelp "PRIVMSG $nick :\002!delhost <nick> <hostmask>\002"
puthelp "PRIVMSG $nick :Delete specified hostmask for a specified user."
} elseif {$htext == "addchan"} {
puthelp "PRIVMSG $nick :This command can be used by global masters/owners only:"
puthelp "PRIVMSG $nick :\002!addchan <#channel>\002"
puthelp "PRIVMSG $nick :Add a specified channel in $botnick's database."
} elseif {$htext == "delchan"} {
puthelp "PRIVMSG $nick :This command can be used by global masters/owners only:"
puthelp "PRIVMSG $nick :\002!delchan <#channel>\002"
puthelp "PRIVMSG $nick :Delete a specified channel in $botnick's database."
} elseif {$htext == "chanset"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel masters/owners only:"
puthelp "PRIVMSG $nick :\002!chanset <#channel> <settings>\002"
puthelp "PRIVMSG $nick :Change/Upgrade channel settings."
} elseif {$htext == "topic"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!topic <topic>\002"
puthelp "PRIVMSG $nick :Shortcuts \: \002!t <topic>\002"
} elseif {$htext == "rehash"} {
puthelp "PRIVMSG $nick :This command can be used by global masters/owners :"
puthelp "PRIVMSG $nick :\002!rehash\002"
puthelp "PRIVMSG $nick :Reload new scripts/settings."
} elseif {$htext == "restart"} {
puthelp "PRIVMSG $nick :This command can be used by global owners :"
puthelp "PRIVMSG $nick :\002!restart\002"
puthelp "PRIVMSG $nick :Restart \002$botnick\002 , Restarts the Tcl interpreter, wipes all timers, reloads all modules and reloads $botnick's config file."
} elseif {$htext == "die"} {
puthelp "PRIVMSG $nick :This command can be used by global owners :"
puthelp "PRIVMSG $nick :\002!die\002"
puthelp "PRIVMSG $nick :his kills the bot. The bot goes offline immediately with a specified reason."
} elseif {$htext == "vb"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!vb <nick>\002"
puthelp "PRIVMSG $nick :Kick ban a specified user from the channel with a suitable reason for spamming/advertising."
} elseif {$htext == "nb"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel operators/masters/owners :"
puthelp "PRIVMSG $nick :\002!nb <nick>\002"
puthelp "PRIVMSG $nick :Kick ban a specified user from the channel with a suitable reason for badnick."
} elseif {$htext == "?server"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel masters/owners :"
puthelp "PRIVMSG $nick :\002?server\002"
puthelp "PRIVMSG $nick :Show the server the bot is connected to."
} elseif {$htext == "?channels"} {
puthelp "PRIVMSG $nick :This command can be used by global/channel masters/owners :"
puthelp "PRIVMSG $nick :\002?channels\002"
puthelp "PRIVMSG $nick :Show all the channels the bot is at."
} else {
puthelp "PRIVMSG $nick :Public Channel & User Commands"
puthelp "PRIVMSG $nick :Commands List:"
puthelp "PRIVMSG $nick :!op , !deop , !voice , !devoice , !kick , !ban , !unban , !gunban , !vb , !nb , !topic , !adduser , !chattr , !addop , !addowner , !addhost , !delhost , !addchan , !delchan , !chanset , ?channels , ?server"
puthelp "PRIVMSG $nick :For Further Information About Any Command Type This Without Public Characters(! . -) \:- /msg $botnick help <command>"
puthelp "PRIVMSG $nick :Example : /msg $botnick pcuhelp op"
  }
}


#EOP

###### EXTRA #######

bind pub m|m ?server server

proc server {nick host hand chan arg} {
  global server
  putserv "NOTICE $nick :I m connected on -> $server"
}

bind pub m|m ?channels chans

proc chans {nick host hand chan arg} {
  putserv "NOTICE $nick :I m on : [channels]"
}

set vb_pro_bmask 1

bind pub o|o .vb virus_ban
bind pub o|o -vb virus_ban

proc virus_ban {nick host hand chan text} {
set vbnick [lindex $text 0]
set vbhost "*!*@[lindex [split [getchanhost $vbnick $chan] @] 1]"
if {$vbnick == ""} {
putquick "NOTICE $nick :!vb <nick>"
  } else {
putquick "MODE $chan +b $vbhost"
putquick "KICK $chan $vbnick :[clock format [clock seconds] -format "%a %d %b %Y"] - You are infected. Please download new IRC client from http://www.mirc.com/get.html & Install it & Rejoin. Thanks"
  }
}

bind pub o|o .nb nick_ban
bind pub o|o -nb nick_ban

proc nick_ban {nick uhost hand chan text} {
set nbnick [lindex $text 0]
if {$nbnick == ""} {
putquick "NOTICE $nick :!nb <nick>"
  } else {
putquick "MODE $chan +b *$nbnick*!*"
putquick "KICK $chan $nbnick :[clock format [clock seconds] -format "%a %d %b %Y"] - Bad/Unacceptable Nickname Detected. Please Change It By Typing /nick <nick> & Rejoin. Thanks"
  }
}

bind msg - version version

proc version {nick host hand text} {
global botnick
putquick "NOTICE $nick :I m an eggdrop($botnick) using Public Channel & User Commands (v2.0) By UsmanAli"
}

##### END OF EXTRA ######

###########################################################################
#---------------------- END OF PUBLIC COMMANDS ---------------------------#
###########################################################################

################################ PUTLOG ##################################################
putlog "Public Channel & User Commands Loaded By UsmanAli"
############################# END OF PUTLOG ##############################################
