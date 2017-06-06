#############################################################################
#                     BismIllah Hir-rah Manir Raheem                        #
#                                                                           #
#           The Mighty Quran Hadeeth and Other Books BOT 1.8                #
#                                                                           #
#                        Make Dua for one and All.                          #
#                                                                           #
#############################################################################

#############################################################################
#                           Do or die things.                               #
#############################################################################

# set base Folder/Directory
# shell users can either use "~/Islam" or "/home/user/Islam"
# Windows Users can either give full path or relative path if its on same drive
# Windows users must user "/" as Directory seperator like "D:/Islam" or "/Islam"
#set tmqhb(root) "d:/Islam"
set tmqhb(root) "/home/usman/eggdrop/scripts"


# Enter names of other bots which can be on a channel.
# In presence of these nicks this script will not work - dont include this bots name itself.
# Ex: set tmqb(bots) "Al-Qalam Al-kitab"
set tmqhb(bots) ""

#############################################################################
#   You dont need to modify below unless you changes directry structures.   #
#############################################################################

# Where did you store the Quran Data Files? Set complete path.
# Use / instead \ even in Dos/Windows.
set tmqb(root) "$tmqhb(root)/Quran/"

# Where did you store the Data Files? Set complete path.
# Use / instead \ even in Dos/Windows.
set tmhb(root) "$tmqhb(root)/Hadeeth/"


source "$tmqhb(root)/RT_Kit5.tcl"
source "$tmqhb(root)/Quran.tcl"
source "$tmqhb(root)/Hadeeth.tcl"
source "$tmqhb(root)/Save.tcl"
source "$tmqhb(root)/RH1-1.tcl"

