#----------------------------------------------------------------------------------------------------------------------#
#                                           AUTO REOP SCRIPT BY RANA USMAN                                             #
#----------------------------------------------------------------------------------------------------------------------#
#ALLAH IS GREATEST
#Salam O Aleikum n Hiya!, Purpose of writing this script is , if someone deop your Bot it will get OP automatically Using 
#Network Services only if bot have access to that channel where it is deoped.There is option for you to set the nick of 
#Service manually.Before there are some scripts available but they do only work for Dalnet or the services having Chanserv
#as nick.But in this script you have option to set the services nick.
#This script works on all the channels where bot is parked

#AUTHOR : Rana Usman 
#Email : coolguy_rusman@yahoo.com
#URL : www.ranausman.tk or www.airevision.tk
#If you have any suggesstion about my script kindly tell me i will be glad to look forward thank you
#Version : 1.2 
                                                                                                                                                                                                                                         
## History 
# Before the bot used to ban the services IP if they deop bot but it is fixed now 
# Thanks to Riderz for reporting bug                                                                                                                            
                                                                                                                          
####################################
#- CONFIGURATION STARTS FROM HERE -# 
####################################

####################
# SET SERVICE NICK #
####################
#Set Service Nick Here means the Network Official Bot, like Undernet's Bot Nick is X 
#FOR UNDERNET USE NICK : X
#FOR DALNET USE : chanserv@services.dal.net
#FOR QUAKENET USE : Q or L (depends what bot you have on your Channel)
#FOR NETWORK HAVING SERVICES LIKE Nickserv and Chanserv Use : CHANSERV

set servicenick "ChanServ@services.dal.net"

##################
# SET PUNISHMENT #
##################

#You have Four options Use 0,1,2 or 3
#Set it as '0' If you dont want bot to take any action against the user which deoped your bot
#Set it as '1' If you want Bot to KICK the user who deoped your bot 
#Set it as '2' If you want Bot to KICK n BAN the User who deoped your bot
#Set it as '3' If you want Bot to DEOP the user who deoped your bot

set punish "2"

###################
# SET KICK REASON #
###################

#Set Reason here In Case you set the upper Option as 1 or 2 
#::REMEMBER::  BOT will only kick if the SET PUNISHMENT OPTION IS SET TO 1 or 2

set deopkickreason "12{Anti Deop Protection} 5Kindly Dont Deop Me Next Time"

###########################
# CONFIGURATION ENDS HERE #
###########################

#--------------------------------------------------------------------------------------------------------------------#
#   SCRIPT STARTS FROM HERE...MAKE IT BETTER WITH YOUR SKILLS IF YOU CAN.I DONT RESTRICT YOU TO NOT TO TOUCH CODE!   #
#--------------------------------------------------------------------------------------------------------------------#

bind mode - "*-*o*" RanaUsman:autoreop
proc RanaUsman:autoreop {nick uhost hand chan mode target} {
global botnick servicenick punish deopkickreason
if {($target == $botnick) && ($nick != $botnick)} {
if {($nick == "X") || ($nick == "Q") || ($nick == "L") || ($nick == "chanserv")} { return 0 }
putlog "\002BOT DEOPED ON $chan by $nick"
putlog "\002REOPING BOT ON $chan"
putserv "PRIVMSG $servicenick :op $chan $botnick"
putlog "\002REOP SUCCESSFULL"
utimer 2 [list RanaUsman:punish $nick $uhost $chan] 
 }
}
proc RanaUsman:punish {nick uhost chan} {
global punish deopkickreason
if {($punish == 0)} { return 0 }
if {($punish == 1)} { 
if {($nick == "X") || ($nick == "Q") || ($nick == "L") || ($nick == "chanserv")} { return 0 }
putquick "KICK $chan $nick :$deopkickreason"
putlog "\002$nick Kicked from $chan for Deoping me on $chan "
 }
if {($punish == 2)} { 
if {($nick == "X") || ($nick == "Q") || ($nick == "L") || ($nick == "chanserv")} { return 0 }
putquick "MODE $chan +b *!*@[lindex [split $uhost @] 1]"
putquick "KICK $chan $nick :$deopkickreason"
putlog "\002 $nick BAN N KICKED FROM $chan FOR DEOPING ME ON $chan"
}
if {($punish == 3)} { 
putquick "MODE $chan -o $nick"
putlog "\002$nick DEOPED FOR DEOPING ME ON $chan"
 }
} 
############################################################################################
putlog "=- \002DEOP PROTECTION BY RANA USMAN (www.ranausman.tk) LOADED SUCCESSFULLY \002 -="
############################################################################################

