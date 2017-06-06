#############################################################################
#                     BismIllah Hir-rah Manir Raheem                        #
#                                                                           #
#                       The Mighty Quran BOT 7.9                            #
#                                                                           #
#                        Make Dua for one and All.                          #
#                                                                           #
#############################################################################

#############################################################################
#                           Do or die things.                               #
#############################################################################

# Which Translation do you like to use as default. If any1 says 'Quran 1:1'
# then this setting will be used. All 114 files must be there.
# Options are : hq nq gq tk 
set tmqb(trans_default) aq

#############################################################################
#                  If you wish to tweak / set it to ur choice.              #
#############################################################################

# How many Ayahs will this Script allow in one command?
# If its 3 then 'Quran 112:1-4' will be treated as 'Quran 112:1-3'.
#set tmqb(limit_ayah) 7

# How many bytes/charecter of Quran this Script allow in one command?
# If its 100 then 'Quran 5:3-4' will be treated as 'Quran 5:3'.
#set tmqb(size_ayah) 600

# Name the file which u wish to use to look for Surah names for searching.
# You can make your own (if you can.) This file must be in tmqb(root).
set tmqb(surah_search) surah_name_search

# Enter all the Translation initails used in this script.
set tmqb(trans_list) "aq nq gq hq sq ar tq tl tc tn de es fr it nl se fi ro ba mk id my uz tr tk fk ik e0 di"

#############################################################################
#  Dont exceed this limit, even if you wish then do it on your own risk ;)  #
#  BEWARE!!! H A R M F U L L   C O D E S   B E L O W   T H I S   L I N E .  #
#############################################################################

set tmqb(version) 7.9
set tmqb(name) "The Mighty Quran BOT"

  if {[info exists gaim::version]} {
    namespace import gaim::*
    set tmqb(log) "gaim::debug -info \"TMQB\""
  } elseif {[info exists version]} {
    set tmqb(log) "putlog"
  } else {
    set tmqb(log) "puts"
  }

eval "$tmqb(log) \"Trying to load.....$tmqb(name) $tmqb(version), InshaAllah\""


if {[info exists RT_Kit]} {
  if {!$RT_Kit(version)==5} {
    eval "$tmqb(log) \"*** ERROR: Can't load The Mighty Quran BOT $tmqb(version) -- First Load RT_Kit5.tcl\""
    return 0
  }
}

#############################################################################
#                               Main Codes                                  #
#############################################################################

#############################################################################
#                          One time initialisation                          #
#############################################################################


set tmqb(trans_list) [string tolower $tmqb(trans_list)]

eval "$tmqb(log) \"Doing one time Initialisation of Quran BOT. This will take long.....\""
eval "$tmqb(log) \"Looking for Basic Working Files.\""

if {![file exist $tmqb(root)/surah_list] } {
  eval "$tmqb(log) \"*** WARNING: Surah List file is missing from $tmqb(root)\""
}

if {![file exist $tmqb(root)/$tmqb(surah_search)] || ![file exist $tmqb(root)/quran_extra]} {
  eval "$tmqb(log) \"*** WARNING: Some working files are missing from $tmqb(root)\""
}
eval "$tmqb(log) \"Looking for Quran DATA Files.\""

foreach mq_tcode $tmqb(trans_list) {
  set mq_files 0
  for {set mq_f_no 1} {$mq_f_no<=4} {incr mq_f_no} {
    if {![file exist $tmqb(root)/$mq_tcode-$mq_f_no]} {incr mq_files}
  }

 if {$mq_files} {
    eval "$tmqb(log) \"*** WARNING: $mq_files file(s) missing from $tmqb(root) directory. Hence disabling $mq_tcode option.\""
    set tmqb(valid,$mq_tcode) 0
#   set tmqb(ban1,$mq_tcode) "The Quran"
#   set tmqb(ban2,$mq_tcode) "The End of Translation"
    set tmqb(alias,$mq_tcode) "$mq_tcode"
  } {
    set tmqb(valid,$mq_tcode) 1
    if {[file exist $tmqb(root)/$mq_tcode-info]} {
      set tmqb(ban1,$mq_tcode) [RT_read_line $tmqb(root)/$mq_tcode-info 1]
      set tmqb(ban2,$mq_tcode) [RT_read_line $tmqb(root)/$mq_tcode-info 2]
      set tmqb(alias,$mq_tcode) [RT_lappend $mq_tcode [string tolower [RT_read_line $tmqb(root)/$mq_tcode-info 3]]]
    } {
      set tmqb(ban1,$mq_tcode) "The Quran"
      set tmqb(ban2,$mq_tcode) "The End of Translation"
      set tmqb(alias,$mq_tcode) "$mq_tcode"
    }
  }
}


if {[info exists tmqb(trans_default)]} {
  if {!$tmqb(valid,$tmqb(trans_default))} { 
    eval "$tmqb(log) \"*** ERROR: Default Quran Data files are missing?\""
    eval "$tmqb(log) \"*** ERROR: Failed to load Quran BOT\"";return 0} 
} { eval "$tmqb(log) \"*** ERROR: Edit your Quran Script and set tmqb(trans_default) <code>\"";
  eval "$tmqb(log) \"*** ERROR: Failed to load Quran BOT\"";return 0
}
unset mq_files mq_tcode mq_f_no


set tmqb(cnt_file) "0 1596 1563 1516 1561"
#set tmqb(surah_name) "{} {FÂTIHA} {BAKARA} {ÂL-I IMRÂN} {NISÂ} {MÂIDE} {EN'ÂM} {A'RÂF} {ENFÂL} {TEVBE} {YÛNUS} {HÛD} {YÛSUF} {RA'D} {IBRÂHIM} {HICR} {NAHL} {ISRÂ} {KEHF} {MERYEM} {TÂ HÂ} {ENBIYÂ} {HAC} {MÜ'MINÛN} {NÛR} {FURKÂN} {SU'ARÂ} {NEML} {KASAS} {ANKEBÛT} {RÛM} {LOKMÂN} {SECDE} {AHZÂB} {SEBE'} {FÂTIR} {YÂSÎN} {SÂFFÂT} {SÂD} {ZÜMER} {MÜ'MIN} {FUSSILET} {SÛRÂ} {ZUHRUF} {DUHÂN} {CÂSIYE} {AHKÂF} {MUHAMMED} {FETIH} {HUCURÂT} {KÂF} {ZÂRIYÂT} {TÛR} {NECM} {KAMER} {RAHMÂN} {VÂKI'A} {HADÎD} {MÜCÂDELE} {HASR} {MÜMTEHINE} {SAFF} {CUM'A} {MÜNÂFIKÛN} {TEGÂBUN} {TALÂK} {TAHRÎM} {MÜLK} {KALEM} {HÂKKA} {ME'ÂRIC} {NÛH} {CIN} {MÜZZEMMIL} {MÜDDESSIR} {KIYÂME} {INSAN} {MÜRSELÂT} {NEBE'} {NÂZI'ÂT} {ABESE} {TEKVÎR} {INFITÂR} {MUTAFFIFÎN} {INSIKÂK} {BÜRÛC} {TÂRIK} {A'LÂ} {GÂSIYE} {FECR} {BELED} {SEMS} {LEYL} {DUHÂ} {INSIRÂH} {TÎN} {ALÂK} {KADR} {BEYYINE} {ZILZÂL} {ÂDIYÂT} {KÂRI'A} {TEKÂSÜR} {ASR} {HÜMEZE} {FÎL} {KUREYS} {MÂ'ÛN} {KEVSER} {KÂFIRÛN} {NASR} {TEBBET} {IHLÂS} {FELÂK} {NÂS}"
set tmqb(surah_name) "{} Al-Fatihah Al-Baqarah Al-'Imran An-Nisa' Al-Ma'idah Al-An'am Al-A'raf Al-Anfal At-Taubah Yunus Hud Yusuf Ar-Ra'd Ibrahim Al-Hijr An-Nahl Al-Isra' Al-Kahf Maryam Ta-Ha Al-Anbiya' Al-Hajj Al-Mu'minun An-Nur Al-Furqan Ash-Shu'ara' An-Naml Al-Qasas Al-'Ankabut Ar-Rum Luqman As-Sajdah Al-Ahzab Saba' Fatir Ya-Sin As-Saffat Sad Az-Zumar Ghafir Fussilat Ash-Shura Az-Zukhruf Ad-Dukhan Al-Jathiya Al-Ahqaf Muhammad Al-Fath Al-Hujurat Qaf Az-Zariyat At-Tur An-Najm Al-Qamar Ar-Rahman Al-Waqi'ah Al-Hadid Al-Mujadilah Al-Hashr Al-Mumtahinah As-Saff Al-Jumu'ah Al-Munafiqun At-Taghabun At-Talaq At-Tahrim Al-Mulk Al-Qalam Al-Haqqah Al-Ma'arij Nuh Al-Jinn Al-Muzzammil Al-Muddaththir Al-Qiyamah Al-Insan Al-Mursalat An-Naba' An-Nazi'at 'Abasa At-Takwir Al-Infitar Al-Mutaffifin Al-Inshiqaq Al-Buruj At-Tariq Al-A'la Al-Ghashiyah Al-Fajr Al-Balad Ash-Shams Al-Lail Ad-Duha Ash-Sharh At-Tin Al-'Alaq Al-Qadr Al-Baiyinah Az-Zalzalah Al-'Adiyat Al-Qari'ah At-Takathur Al-'Asr Al-Humazah Al-Fil Quraish Al-Ma'un Al-Kauthar Al-Kafirun An-Nasr Al-Masad Al-Ikhlas Al-Falaq An-Nas" 
set tmqb(ayah_max) "0 7 286 200 176 120 165 206 75 129 109 123 111 43 52 99 128 111 110 98 135 112 78 118 64 77 227 93 88 69 60 34 30 73 54 45 83 182 88 75 85 54 53 89 59 37 35 38 29 18 45 60 49 62 55 78 96 29 22 24 13 14 11 11 18 12 12 30 52 52 44 28 28 20 56 40 31 50 40 46 42 29 19 36 25 22 17 19 26 30 20 15 21 11 8 8 19 5 8 8 11 11 8 3 9 5 4 7 3 6 3 5 4 5 6"
set tmqb(sajdah) "0 1160 1722 1951 2138 2308 2613 2672 2915 3185 3518 3994 4256 4846 5905 6125"
set tmqb(ruku_list) "0 7 14 27 36 46 53 66 68 78 89 93 103 110 119 128 136 148 155 159 170 174 183 189 195 203 217 223 228 235 238 242 249 255 260 264 267 273 280 288 290 293 302 313 323 334 347 356 364 373 384 394 402 413 422 436 441 448 464 473 482 493 503 507 515 518 526 535 543 552 563 569 580 584 589 593 597 605 608 619 627 634 645 655 664 669 674 680 688 695 703 712 719 725 735 746 755 762 769 777 784 789 799 809 819 830 839 844 849 859 871 879 883 889 899 910 918 929 933 939 943 954 964 979 985 993 1001 1007 1012 1018 1026 1038 1047 1053 1062 1080 1083 1095 1101 1105 1111 1116 1125 1135 1142 1160 1170 1179 1188 1197 1204 1208 1218 1224 1229 1235 1241 1251 1259 1264 1272 1277 1294 1301 1307 1315 1324 1334 1345 1353 1357 1364 1374 1384 1394 1404 1417 1424 1434 1446 1456 1467 1473 1481 1497 1508 1522 1533 1541 1556 1568 1582 1596 1602 1616 1625 1631 1638 1645 1653 1664 1675 1689 1700 1707 1714 1725 1733 1738 1744 1750 1756 1762 1771 1777 1784 1791 1802 1817 1827 1846 1862 1881 1901 1910 1922 1926 1935 1941 1951 1961 1966 1971 1977 1984 1990 2001 2011 2020 2029 2039 2051 2059 2069 2081 2089 2099 2106 2113 2122 2129 2140 2152 2157 2163 2171 2184 2189 2193 2199 2210 2222 2241 2250 2265 2290 2300 2315 2332 2348 2372 2402 2424 2437 2452 2463 2483 2493 2512 2524 2533 2558 2576 2595 2605 2617 2620 2628 2633 2643 2652 2659 2667 2673 2695 2705 2723 2750 2765 2791 2801 2811 2817 2825 2831 2841 2848 2852 2855 2864 2875 2889 2899 2915 2932 2941 2965 2983 3000 3036 3054 3072 3091 3107 3123 3159 3165 3173 3190 3203 3217 3225 3241 3252 3265 3273 3280 3294 3302 3312 3327 3334 3340 3353 3362 3370 3384 3391 3403 3409 3419 3428 3436 3449 3462 3469 3480 3488 3499 3503 3514 3525 3533 3541 3553 3560 3567 3573 3585 3591 3601 3606 3615 3627 3636 3642 3651 3660 3667 3674 3686 3697 3705 3717 3737 3755 3772 3788 3809 3862 3901 3926 3970 3984 3996 4010 4034 4058 4067 4079 4089 4099 4110 4121 4128 4133 4142 4153 4160 4170 4183 4193 4201 4211 4218 4223 4226 4235 4243 4250 4262 4272 4281 4291 4301 4315 4325 4340 4350 4360 4370 4381 4392 4414 4436 4443 4456 4473 4484 4494 4499 4510 4520 4530 4536 4545 4556 4563 4573 4583 4593 4600 4609 4612 4622 4630 4645 4659 4675 4698 4721 4735 4763 4784 4809 4816 4846 4868 4886 4901 4926 4946 4979 5017 5053 5075 5085 5094 5100 5104 5110 5117 5126 5136 5143 5150 5156 5163 5172 5177 5185 5188 5196 5199 5209 5217 5224 5229 5236 5241 5255 5271 5304 5323 5360 5375 5410 5419 5439 5447 5466 5475 5494 5495 5526 5551 5581 5591 5613 5622 5662 5672 5702 5712 5738 5758 5800 5829 5848 5884 5905 5909 5931 5948 5967 5993 6023 6043 6058 6079 6090 6098 6106 6125 6130 6138 6146 6157 6168 6176 6179 6188 6193 6197 6204 6207 6213 6216 6221 6225 6230 6236"
set tmqb(total) [total_from_list $tmqb(ayah_max)]
set tmqb(emph_wrds) "Allah Muhammad Quran Qur\'an Merciful Paradise {Hell Fire} Forgiveness messenger prophet obey follow love"
set tmqb(ban1,al) "Multiple Translation of the Quran"
set tmqb(ban2,al) "For more info type: Quran Translations"
set tmqb(alias,ar) "ar ÚÑÈ* {ÚÑ È*}"

proc tmqb_cs_irc { } {
  global tmqb
  set tmqb(c,1s) 00,03
  set tmqb(c,1e) 
  set tmqb(c,2s) 01,15
  set tmqb(c,2e) 
  set tmqb(c,hl) 08
  set tmqb(c,rs) 
  set tmqb(c,re) 
  set tmqb(c,bs) 
  set tmqb(c,be) 
  set tmqb(c,us) 
  set tmqb(c,ue) 
  set tmqb(c,Bs) 02
  set tmqb(c,Be) 
  set tmqb(c,Ls) 12
  set tmqb(c,Le) 
  set tmqb(c,Rs) 04
  set tmqb(c,Re) 
  set tmqb(c,Gs) 14
  set tmqb(c,Ge) 
  set tmqb(c,0s) 00
  set tmqb(c,0e) 
  set tmqb(limit_ayah) 7
  set tmqb(size_ayah) 600
  set tmqb(length_ayah) 380
}
	
proc tmqb_cs_yahoo { } {
  global tmqb
  set tmqb(c,1s) "<font face=\"Fixedsys\"><font size=\"3\" absz=\"12\"><font color=\"#008F00\"><b>"
  set tmqb(c,1e) "</b></font></font>"
  set tmqb(c,2s) "<font face=\"Fixedsys\"><font size=\"4\" absz=\"14\"><font color=\"#7F0000\">"
  set tmqb(c,2e) "</font></font>"
  set tmqb(c,hl) "<font color=\"#00F700\">"
  set tmqb(c,rs) "<i>"
  set tmqb(c,re) "</i>"
  set tmqb(c,bs) "<b>"
  set tmqb(c,be) "</b>"
  set tmqb(c,us) "<u>"
  set tmqb(c,ue) "</u>"
  set tmqb(c,Bs) "<font color=\"#00007F\">"
  set tmqb(c,Be) "</font>"
  set tmqb(c,Ls) "<font color=\"#8000FF\">"
  set tmqb(c,Le) "</font>"
  set tmqb(c,Rs) "<font color=\"#FF0000\">"
  set tmqb(c,Re) "</font>"
  set tmqb(c,Gs) "<font color=\"#7F7F7F\">"
  set tmqb(c,Ge) "</font>"
  set tmqb(c,0s) "<font color=\"#000000\">"
  set tmqb(c,0e) "</font>"
  set tmqb(limit_ayah) 10
  set tmqb(size_ayah) 9999
  set tmqb(length_ayah) 400
}

proc tmqb_cs_html { } {
  global tmqb
  set tmqb(c,1s) "<table border=0><tr><td colspan=2><font face=\"Fixedsys\"><font color=\"#008F00\"><b>"
  set tmqb(c,1e) "</b></font></font></td></tr></table>"
  set tmqb(c,2s) "<table border=0><tr><td><font face=\"Fixedsys\"><font color=\"#7F0000\">"
  set tmqb(c,2e) "</font></font></td></tr></table>"
  set tmqb(c,hl) "<font color=\"#00F700\">"
  set tmqb(c,rs) "<i>"
  set tmqb(c,re) "</i>"
  set tmqb(c,bs) "<b>"
  set tmqb(c,be) "</b>"
  set tmqb(c,us) "<u>"
  set tmqb(c,ue) "</u>"
  set tmqb(c,Bs) "<font color=\"#00007F\">"
  set tmqb(c,Be) "</font>"
  set tmqb(c,Ls) "<font color=\"#8000FF\">"
  set tmqb(c,Le) "</font>"
  set tmqb(c,Rs) "<font color=\"#FF0000\">"
  set tmqb(c,Re) "</font>"
  set tmqb(c,Gs) "<font color=\"#7F7F7F\">"
  set tmqb(c,Ge) "</font>"
  set tmqb(c,0s) "<font color=\"#000000\">"
  set tmqb(c,0e) "</font>"
  set tmqb(limit_ayah) 20
  set tmqb(size_ayah) 9999
  set tmqb(length_ayah) 99999
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





#  set tmqb(c,1s) 00,02            # Banner Line Start
#  set tmqb(c,1e)                  # Banner Line End
#  set tmqb(c,2s) 02,15            # Body Line Start
#  set tmqb(c,2e)                  # Body Line End
#  set tmqb(c,hl) 02,08            # Highlighted words
#  set tmqb(c,rs)                  # Reverse Start
#  set tmqb(c,re)                  # Reverse End
#  set tmqb(c,bs)                  # Bold Start
#  set tmqb(c,be)                  # Bold End
#  set tmqb(c,us)                   # Underline Start
#  set tmqb(c,ue)                   # Underline End
#  set tmqb(c,Rs) 03               # Red Start
#  set tmqb(c,Re)                  # Red End
#  set tmqb(c,Gs) 14               # Gray End
#  set tmqb(c,Ge)                  # Gray End


  
#############################################################################
#          Following codes are used to perform IRC Parsings.                #
#############################################################################


proc tmqb_main {who mq_args} {
  global tmqb
  set mq_trans_requ ""
  set who [string tolower $who]
  
  if {[string match "html_*" $who]} { tmqb_cs_html }
	  
  if {![info exists tmqb(last,$who)]} { set tmqb(last,$who) 0 }
  if {![info exists tmqb(tran,$who)]} { set tmqb(tran,$who) $tmqb(trans_default) }

  foreach mq_arg_vrb [string tolower $mq_args] {lappend mq_arg $mq_arg_vrb}
  #[stripcodes bcru $mq_args]
  #set mq_arg [lrange $mq_arg 1 end]

  foreach mq_trans_check $mq_arg {
    foreach mq_tcode $tmqb(trans_list) {
      foreach mq_alias_in $tmqb(alias,$mq_tcode) {
        if {[string match $mq_alias_in $mq_trans_check]} {
          set mq_trans_requ [RT_lappend $mq_trans_requ $mq_tcode]
          set mq_arg [lreplace $mq_arg [lsearch $mq_arg $mq_alias_in] [lsearch $mq_arg $mq_alias_in]]
          set mq_trans_found 1
        }
      }
    }
  }

  if {![info exists mq_trans_found]} {
    set mq_trans_requ $tmqb(tran,$who)
  } 
  set mq_trans [lindex $mq_trans_requ 0]

  set mq_ret_val [switch -glob [lindex $mq_arg 0] {
    [0-9]* {format 0}
    save {
      tmqb_save
    }
    auto {
      return [tmqb_main auto_$who "$mq_trans [lrange $mq_arg 1 end] ="]
    }
    reader {
      global RT_Kit rh_timer
      if { [lindex $mq_arg 1] == "stop" } {
        if {[info exists tmqb(reader,$who,count)]} { set tmqb(reader,$who,count) -1 }
        if {[info exists tmqb(reader,$who,buffer)]} { set tmqb(reader,$who,buffer) "" }
        if {[info exists tmqb(reader,$who,timer)]} {catch killtimer $tmqb(reader,$who,timer)}
        return [list "Reader Stopped"]
      }
      if { [lindex $mq_arg 1] == "speed" } { 
        if {[lindex $mq_arg 2]>3} {
          set tmqb(reader,$who,speed) [lindex $mq_arg 2]
          return [list "Setting Speed to [lindex $mq_arg 2]"]
        } {
          return [list "Speed [lindex $mq_arg 2] not set - using old speed $tmqb(reader,$who,speed) - Minimum Speed can be 4."]
        }
      }

      if { [lrange $mq_arg 1 end] != "" } {
        variable mq_idx1 1  mq_idx2 1  mq_idx3 1
        if {![info exists tmqb(reader,$who,speed)]} { set tmqb(reader,$who,speed) 10 }

        set mq_scanarg [split [lrange $mq_arg 1 end] :-.\;\ ]
        scan [lrange $mq_scanarg 0 3] "%d %d %d" mq_idx1 mq_idx2 mq_idx3

        if { $mq_idx3 > 100} {
          set tmqb(reader,$who,count) 100
        } {
          set tmqb(reader,$who,count) $mq_idx3
        }

        set tmqb(reader,$who,trans) $mq_trans_requ
        set tmqb(reader,$who,buffer) [tmqb_main $who "$tmqb(reader,$who,trans) $mq_idx1:$mq_idx2 %"]
        incr tmqb(reader,$who,count) -1

        if {[info exists tmqb(reader,$who,timer)]} {catch killtimer $tmqb(reader,$who,timer)}

        set tmqb(reader,$who,timer) [utimer 7 "tmqb_main $who reader"] ; putlog timer-set
        return [list "$tmqb(c,1s) Now showing Quran from $mq_idx1:$mq_idx2 and continuing upto [expr $tmqb(reader,$who,count)+1] verses. At speed level $tmqb(reader,$who,speed) $tmqb(c,1e)"]
      } {
        if {![info exists tmqb(reader,$who,buffer)]} { set tmqb(reader,$who,buffer) "" }
        if {[llength $tmqb(reader,$who,buffer)]==0} {
          set tmqb(reader,$who,buffer) [tmqb_main $who "$tmqb(reader,$who,trans) next %"]
          incr tmqb(reader,$who,count) -1
        }
        set mq_reptxt [lindex $tmqb(reader,$who,buffer) 0]
        set tmqb(reader,$who,buffer) [lrange $tmqb(reader,$who,buffer) 1 end]
        set mq_secs [expr 5+([string length $mq_reptxt]/$tmqb(reader,$who,speed))]

        if {$tmqb(reader,$who,count)>0 || [llength $tmqb(reader,$who,buffer)]>0} { set tmqb(reader,$who,timer) [utimer $mq_secs "tmqb_main $who reader"] }

        if {![info exist RT_Kit(buffer,$who)]} { after 100 "RT_Queue_IRC $who" }
        lappend RT_Kit(buffer,$who) "4\[ 0,14 $mq_reptxt  4\] \00315$mq_secs $tmqb(reader,$who,count) more 0,0_______________________________________________________________________"
        #rh_set_timer Reader reader@quranbot.com - $who -
        set rh_timer($who,cnt) 100
      }

      return 1
    }
    info {
      lappend mq_reptxt "$tmqb(c,1s) [RT_read_line $tmqb(root)/$mq_trans-info 11] $tmqb(c,0s)$tmqb(version). $tmqb(c,1e)"
      lappend mq_reptxt "$tmqb(c,2s) [RT_read_line $tmqb(root)/$mq_trans-info 12] $tmqb(c,2e)"
      lappend mq_reptxt "$tmqb(c,2s) [RT_read_line $tmqb(root)/$mq_trans-info 13] $tmqb(c,2e)"
      lappend mq_reptxt "$tmqb(c,2s) [RT_read_line $tmqb(root)/$mq_trans-info 14] $tmqb(c,2e)"
      lappend mq_reptxt "$tmqb(c,1s) Aliases are [string toupper $tmqb(alias,$mq_trans)] - [RT_read_line $tmqb(root)/$mq_trans-info 15] $tmqb(c,1e)"
      return $mq_reptxt
    }
    topic {
      if {[lindex $mq_arg 1]==""} {return [list "Syntax: Quran Topic #Channel <Command>"] }

      if {[lindex $mq_arg 2]==""} {set mq_topic [tmqb_main $who {Random !@=}]} {
        set mq_topic [tmqb_main $who [concat [lrange $mq_arg 2 end] =]]}

      set mq_topic [lindex $mq_topic 0]
      if {[string length $mq_topic]>235} {return [list " This Ayah is too long for Topic. "]}

      putserv "TOPIC [lindex $mq_arg 1] :$mq_topic"
      return [list "Setting Topic of [lindex $mq_arg 1] to $mq_topic"] 
    }
    set {
      if {[info exist [lindex $mq_args 1]]} {
        if {[lindex $mq_args 2]==""} {
          return [list "$[lindex $mq_args 1] = [expr $[lindex $mq_args 1]]"]
        } {
          set mq_old_arg [expr $[lindex $mq_args 1]]
          set [lindex $mq_args 1] [lrange $mq_args 2 end]
          return [list "Setting [lindex $mq_args 1] from $mq_old_arg to [lrange $mq_args 2 end]"] 
        }
      } {
        return [list "Theres no variable like [lindex $mq_args 1]."]}
    }
    help {
      set mq_reptxts [list "$tmqb(c,1s) Help System for $tmqb(name) $tmqb(c,0s)V$tmqb(version) $tmqb(c,1e)"]
      if {[lindex $mq_args 1] == "" } { set mq_help_topic help } { set mq_help_topic [lindex $mq_args 1] } 
      if {[file exist $tmqb(root)\quran_extra]} {
	set mq_reptxt [RT_read_topic $tmqb(root)\quran_extra $mq_help_topic*]
      } {return [list " File not found. "]}
      
      foreach mq_t $mq_reptxt {
        lappend mq_reptxts "$tmqb(c,2s) [eval list $mq_t] $tmqb(c,2e)"
      }
      return $mq_reptxts
    }
    transla* { 
      lappend mq_tlist "$tmqb(c,1s) Followings are Translations and Translitrations available on this BOT $tmqb(c,1e)"
      foreach mq_trans $tmqb(trans_list) {
        if {!$tmqb(valid,$mq_trans)} {continue}
#       lappend mq_tlist "$tmqb(c,2s) [string toupper $mq_trans] $tmqb(ban1,$mq_trans) : $tmqb(ban2,$mq_trans) Aliase are: $tmqb(alias,$mq_trans) $tmqb(c,2e) "
        lappend mq_tlist "$tmqb(c,2s) $tmqb(c,rs)[string toupper $mq_trans]$tmqb(c,re) [lindex $tmqb(alias,$mq_trans) 1] Aliase are: $tmqb(alias,$mq_trans) $tmqb(c,2e) "
      }
      lappend mq_tlist "$tmqb(c,1s) If you want Translations to be added/modified then contact on quran.noble@gmail.com $tmqb(c,1e)"
      return $mq_tlist
    }
    list { 
      lappend mq_tlist "$tmqb(c,1s) Followings are Translations and Translitrations available on this BOT $tmqb(c,1e)"
      foreach mq_trans $tmqb(trans_list) {
        if {!$tmqb(valid,$mq_trans)} {continue}
        append mq_tlists "$tmqb(c,2s) $tmqb(c,rs)[string toupper $mq_trans]$tmqb(c,re) [string totitle [lindex $tmqb(alias,$mq_trans) 1]] $tmqb(c,2e) "
      }
      lappend mq_tlist $mq_tlists
      lappend mq_tlist "$tmqb(c,1s) If you want Translations to be added/modified then contact on quran.noble@gmail.com $tmqb(c,1e)"
      return $mq_tlist
    }
    settran* {
      set tmqb(tran,$who) $mq_trans_requ
      foreach mq_trans $mq_trans_requ { append mq_tlists "[string totitle [lindex $tmqb(alias,$mq_trans) 1]] " }
      return [list "Setting Default Translation as $tmqb(c,Rs)$mq_tlists$tmqb(c,Re)- Just type $tmqb(c,Bs)Quran Surah-No Ayah-No and you will see Quran in $tmqb(c,Rs)$mq_tlists$tmqb(c,Re) $tmqb(c,Be)" ]
    }
    surah - chapter {
      set mq_surah_cnt 1
      for {set mq_surah_line 1} {$mq_surah_line<=6} {incr mq_surah_line} {
        for {set mq_surah_counter 1} {$mq_surah_counter<20} {incr mq_surah_counter} {
          append mq_surah_out "$tmqb(c,rs)$mq_surah_cnt$tmqb(c,re).$tmqb(c,Ls)[lindex $tmqb(surah_name) $mq_surah_cnt]-$tmqb(c,Rs)[lindex $tmqb(ayah_max) $mq_surah_cnt] "
          incr mq_surah_cnt
        }
      lappend mq_reptxt $mq_surah_out
      set mq_surah_out ""
      }
      return $mq_reptxt
    }
    context {
      set mq_scanarg [split $mq_arg :-.\ ]
      set mq_rukulook [index2serial [lindex $mq_scanarg 1] [lindex $mq_scanarg 2] $tmqb(ayah_max)]
      set mq_rukufirst [lindex $tmqb(ruku_list) 0]

      foreach mq_ruku $tmqb(ruku_list) { 
        if { $mq_ruku >= $mq_rukulook } { 
          set mq_rukulast $mq_ruku
          break } {
          set mq_rukufirst $mq_ruku }
      }
      set mq_rukuout1 [serial2index [expr $mq_rukufirst+1] $tmqb(ayah_max)]
      set mq_rukuout2 [serial2index $mq_rukulast $tmqb(ayah_max)]
      set mq_arg "[lindex $mq_rukuout1 0]:[lindex $mq_rukuout1 1]-[lindex $mq_rukuout2 1] [lrange $mq_arg 3 end]"
      format 0
    }
    ruku {
      set mq_scanarg [split $mq_arg :-.\ ]
      set mq_rukulook [index2serial [lindex $mq_scanarg 1] [lindex $mq_scanarg 2] $tmqb(ayah_max)]
      set mq_rukufirst [lindex $tmqb(ruku_list) 0]

      foreach mq_ruku $tmqb(ruku_list) { 
        if { $mq_ruku >= $mq_rukulook } { 
          set mq_rukulast $mq_ruku
          break } {
          set mq_rukufirst $mq_ruku }
      }
      set mq_rukuout1 [serial2index [expr $mq_rukufirst+1] $tmqb(ayah_max)]
      set mq_rukuout2 [serial2index $mq_rukulast $tmqb(ayah_max)]
      return [list "$tmqb(c,1s) Context for [lindex $mq_arg 1]:[lindex $mq_arg 2] is [lindex $mq_rukuout1 0]:[lindex $mq_rukuout1 1]-[lindex $mq_rukuout2 1] which is the [lsearch $tmqb(ruku_list) $mq_rukulast] of 561 Ruku/Bending. $tmqb(c,1e)" ]
    }
    show {
      if {![info exist tmqb(ser,$who:rslt)]} { return [list "$tmqb(c,1s) First do a successful search then try this command. $tmqb(c,1e)"] }
      set mq_rslt_len [llength $tmqb(ser,$who:rslt)]
      if {[llength $tmqb(ser,$who:rslt)]} {
        for {set mq_a_no 1} {$mq_a_no<=[expr $mq_rslt_len>3?3:$mq_rslt_len]} {incr mq_a_no} {
          foreach mq_rslt [tmqb_main $who "[lindex $tmqb(ser,$who:tran) 0] [serial2index [lindex $tmqb(ser,$who:rslt) 0] $tmqb(ayah_max)] =[lrange $mq_arg 1 3]"] { lappend mq_reptxt $mq_rslt }
          set tmqb(ser,$who:rslt) [lrange $tmqb(ser,$who:rslt) 1 end]
        }
      } { return [list "$tmqb(c,1s) No more search results. $tmqb(c,1e)"] }
      return [RT_emph $mq_reptxt $tmqb(ser,$who:word) $tmqb(c,hl) $tmqb(c,2s)]
    }
    search {return [mq_search $who $mq_trans_requ [lrange $mq_arg 1 end]]}
    rand* {expr int($tmqb(total) * rand())}
    last  {expr $tmqb(last,$who)}
    next  {expr [expr $tmqb(last,$who)+1>$tmqb(total)]?[format 1]:[expr $tmqb(last,$who)+1]}
    prev* {expr [expr $tmqb(last,$who)-1<=0]?[format $tmqb(total)]:[expr $tmqb(last,$who)-1]}

    [a-z']* {
      set mq_vrbcnt 0
      set mq_sname ""

      foreach mq_wrdlist $mq_arg {
      if {[string match \[0-9\]* $mq_wrdlist]} {break} {set mq_sname "$mq_sname $mq_wrdlist";incr mq_vrbcnt} }
      
      set mq_sfile [open $tmqb(root)$tmqb(surah_search)]
      for {set mq_surah_num 1} {$mq_surah_num<=114} {incr mq_surah_num} {
        set mq_surah_list [string tolower [gets $mq_sfile]]
        if {[string match "*>$mq_sname >*" $mq_surah_list]} {
          set mq_arg "$mq_surah_num [lrange $mq_arg $mq_vrbcnt end]"
        }
      }
      close $mq_sfile
      format 0
    }
  default {format 0}
  }]

  if {$mq_ret_val} {set mq_arg "[serial2index $mq_ret_val $tmqb(ayah_max)] [lrange $mq_arg 1 3]"}
  tmqb_irc $who $mq_trans_requ $mq_arg
}

#############################################################################
#          Following codes are used to perform irc postings.                #
#############################################################################

proc tmqb_irc {who mq_trans_requ mq_arg} {
  global tmqb
  set mq_idx1 -1 ; set mq_idx2 0 ; set mq_idx3 0
  set mq_scanarg [split $mq_arg :-.\;\ ]
  scan [lrange $mq_scanarg 0 2] "%d %d %d" mq_idx1 mq_idx2 mq_idx3
  set mq_opt [lrange $mq_scanarg 2 5]
  set mq_max_idx2 [lindex $tmqb(ayah_max) $mq_idx1]
# set mq_s_time [clock clicks -milliseconds]

  if {$mq_idx1==-1} { error " Ignoring wrong inputs $who $mq_arg "}

  if {![expr ($mq_idx1<=114) && ($mq_idx1>=1)]} {
    return [list " There are only 114 Surah in Quran. "]
  }

  if {![expr ($mq_idx2>=1) && ($mq_idx2<=$mq_max_idx2)]} {
    set mq_sd_text [RT_read_line $tmqb(root)/surah_list $mq_idx1]
    return [list "$tmqb(c,1s) This is Surah No:[lindex $mq_sd_text 0] containing [lindex $mq_sd_text 1] Ayah. Its chronological Order is [lindex $mq_sd_text 2] and was revealed in [lindex $mq_sd_text 3]. This Surah is known by these names: [lrange $mq_sd_text 4 end] $tmqb(c,1e)"]
  }

  if {$mq_idx3>$mq_max_idx2} {set mq_idx3 $mq_max_idx2}
  if {$mq_idx3<$mq_idx2} {set mq_idx3 $mq_idx2}
  if {[expr $mq_idx3-$mq_idx2+1]>$tmqb(limit_ayah)} {set mq_idx3 [expr $mq_idx2+$tmqb(limit_ayah)-1]}

  set mq_size [expr [string match *\#* $mq_opt]?70:$tmqb(length_ayah)]
  set mq_emp1 [expr [string match *\@* $mq_opt]?"rs":"1s"]
  set mq_emp2 [expr [string match *\@* $mq_opt]?"re":"1e"]
  set mq_emp3 [expr [string match *\@* $mq_opt]?"bs":"2s"]
  set mq_emp4 [expr [string match *\@* $mq_opt]?"be":"2e"]
  set mq_cond [expr [string match *\=* $mq_opt] || [string match *\%* $mq_opt]?1:0]

  set mq_caps [expr [string match *\!* $mq_opt]?1:0]
  set mq_idx_srl [index2serial $mq_idx1 $mq_idx2 $tmqb(ayah_max)]
  set mq_file_no [lindex [serial2index $mq_idx_srl $tmqb(cnt_file)] 0]

 if {[llength $mq_trans_requ]>1} {
    set mq_line_no [lindex [serial2index $mq_idx_srl $tmqb(cnt_file)] 1]
    foreach mq_tcode $mq_trans_requ {
      if {!$tmqb(valid,$mq_tcode)} {continue}
      [expr $mq_cond?"append":"lappend"] mq_txt_out "$tmqb(c,rs)[string toupper $mq_tcode]$tmqb(c,re): [RT_read_line $tmqb(root)/$mq_tcode-$mq_file_no $mq_line_no][expr $mq_cond?\" \":\"\"]"
      set mq_idx2_last $mq_idx2
    }
    set mq_reptxt_bn1 "$tmqb(c,$mq_emp1) $tmqb(ban1,al) Surah:$mq_idx1.[lindex $tmqb(surah_name) $mq_idx1]. Ayah:$mq_idx2 $tmqb(c,$mq_emp2)" 
    set mq_reptxt_bn2 "$tmqb(c,$mq_emp1) $tmqb(ban2,al) $tmqb(c,0s)V$tmqb(version) $tmqb(c,$mq_emp2)"
  } {
    set mq_tcode $mq_trans_requ
    if {!$tmqb(valid,$mq_trans_requ)} {return [list "This option is disabled! Files are missing."]}

    for {set mq_idx2_counter $mq_idx2} {$mq_idx2_counter<=$mq_idx3} {incr mq_idx2_counter} {
      set mq_idx2_serial [index2serial $mq_idx1 $mq_idx2_counter $tmqb(ayah_max)]
      set mq_line_no [lindex [serial2index $mq_idx2_serial $tmqb(cnt_file)] 1]
      set mq_sajd_mark [lsearch $tmqb(sajdah) $mq_idx2_serial]
      set mq_ruku_mark [lsearch $tmqb(ruku_list) $mq_idx2_serial]
      set mq_marks "[expr $mq_ruku_mark>=1?\"®$mq_ruku_mark®\":\"\"][expr $mq_sajd_mark>=1?\"©$mq_sajd_mark©\":\"\"]"
      [expr $mq_cond?"append":"lappend"] mq_txt_out "$mq_idx2_counter.[expr $mq_cond?\"\":\" \"][RT_read_line $tmqb(root)/$mq_trans_requ-$mq_file_no $mq_line_no]$mq_marks[expr $mq_cond?\" \":\"\"]"
      set mq_idx2_last $mq_idx2_counter
      if {[string length $mq_txt_out]>$tmqb(size_ayah)} {break}
    }
      set mq_reptxt_bn1 "$tmqb(c,$mq_emp1) $tmqb(ban1,$mq_trans_requ). Surah:$mq_idx1.[lindex $tmqb(surah_name) $mq_idx1]. $tmqb(c,$mq_emp2)" 
      set mq_reptxt_bn2 "$tmqb(c,$mq_emp1) $tmqb(ban2,$mq_trans_requ). $tmqb(c,0s)V$tmqb(version) $tmqb(c,$mq_emp2)"
  }

  if {$mq_caps} {set mq_txt_out [string toupper $mq_txt_out]}


  switch -glob $mq_opt {
    *\%* {
      set mq_cond_tmp "$mq_idx1:"
      foreach mq_t_cond [RT_format $mq_txt_out 300] {
        lappend mq_reptxt "$mq_cond_tmp$mq_t_cond"
        set mq_cond_tmp ""
      }
      set mq_reptxt [lreplace $mq_reptxt end end [lindex $mq_reptxt end]]
    }
    *\=* {
      set mq_cond_tmp "$tmqb(c,$mq_emp1) Quran:$mq_idx1.[lindex $tmqb(surah_name) $mq_idx1]:$tmqb(c,$mq_emp2)$tmqb(c,$mq_emp3)"
      foreach mq_t_cond [RT_format $mq_txt_out 400] {
        lappend mq_reptxt "$mq_cond_tmp $mq_t_cond $tmqb(c,$mq_emp4)"
        set mq_cond_tmp "$tmqb(c,$mq_emp3)"
      }
      set mq_reptxt [lreplace $mq_reptxt end end "[lindex $mq_reptxt end]$tmqb(c,$mq_emp1) [string toupper $mq_trans_requ] $tmqb(c,0s)V$tmqb(version) $tmqb(c,$mq_emp2)"]
    }
    *\^* {
      set mq_size 50
      set mq_dec1 " | | "
      set mq_dec2 " |\\\\| "
      set mq_deco 0
      set mq_deco_h "The Holy Quran - [string toupper $mq_trans_requ]"
      set mq_head_l [string length $mq_deco_h]
      set mq_head_1 [expr (($mq_size-$mq_head_l)/2)]
      set mq_head_2 [expr ($mq_size-$mq_head_l)-$mq_head_1]

      set mq_deco_f "Surah:$mq_idx1\-[lindex $tmqb(surah_name) $mq_idx1]"
      set mq_foot_l [string length $mq_deco_f]
      set mq_foot_1 [expr (($mq_size-$mq_foot_l)/2)]
      set mq_foot_2 [expr ($mq_size-$mq_foot_l)-$mq_foot_1]
  
      lappend mq_reptxt "$tmqb(c,2s) $tmqb(c,Rs) _!_                                                      _!_ "
      lappend mq_reptxt "$tmqb(c,2s)$tmqb(c,Re)(___)_[string repeat "_" $mq_head_1]$mq_deco_h[string repeat "_" $mq_head_2]_(___)"
      foreach mq_text_vrb $mq_txt_out {
        foreach mq_formated_text [RT_format $mq_text_vrb $mq_size] {
          lappend mq_reptxt "$tmqb(c,2s) $tmqb(c,Rs)[expr $mq_deco?"$mq_dec1":"$mq_dec2"]$tmqb(c,$mq_emp3) $mq_formated_text $tmqb(c,$mq_emp4)$tmqb(c,2s)[string repeat " " [expr $mq_size-[string length $mq_formated_text]]][expr $mq_deco?"$mq_dec1":"$mq_dec2"]"
          set mq_deco [expr $mq_deco?0:1]          
        }
      }
      lappend mq_reptxt "$tmqb(c,2s)$tmqb(c,Rs)(___)_[string repeat "_" $mq_foot_1]$mq_deco_f[string repeat "_" $mq_foot_2]_(___)"

    }
    *\+* {
      set mq_size 50
      set mq_dec1 "06| 13\\\\ 06|"
      set mq_dec2 "06|13\\\\ \\\\06|"
      set mq_deco 0
      set mq_deco_h "The Holy Quran - [string toupper $mq_trans_requ]"
      set mq_head_l [string length $mq_deco_h]
      set mq_head_1 [expr (($mq_size-$mq_head_l)/2)]
      set mq_head_2 [expr ($mq_size-$mq_head_l)-$mq_head_1]

      set mq_deco_f "Surah:$mq_idx1\-[lindex $tmqb(surah_name) $mq_idx1]"
      set mq_foot_l [string length $mq_deco_f]
      set mq_foot_1 [expr (($mq_size-$mq_foot_l)/2)]
      set mq_foot_2 [expr ($mq_size-$mq_foot_l)-$mq_foot_1]

      lappend mq_reptxt "06    !                                                          !   "
      lappend mq_reptxt "06  (___) [string repeat " " $mq_head_1] $mq_deco_h [string repeat " " $mq_head_2] (___)"
      lappend mq_reptxt "06 (_____)____________________________________________________(_____)"
      foreach mq_text_vrb $mq_txt_out {
        foreach mq_formated_text [RT_format $mq_text_vrb $mq_size] {
          lappend mq_reptxt "  [expr $mq_deco?"$mq_dec1":"$mq_dec2"] $tmqb(c,$mq_emp3) $mq_formated_text $tmqb(c,$mq_emp4) [string repeat " " [expr $mq_size-[string length $mq_formated_text]]][expr $mq_deco?"$mq_dec1":"$mq_dec2"]"
          set mq_deco [expr $mq_deco?0:1]          
        }
      }
      lappend mq_reptxt " 06(     ) [string repeat " " $mq_foot_1]$mq_deco_f[string repeat " " $mq_foot_2] (     )"

    }
    default {
      lappend mq_reptxt $mq_reptxt_bn1 
      foreach mq_text_vrb $mq_txt_out {
        foreach mq_formated_text [RT_format $mq_text_vrb $mq_size] {
          lappend mq_reptxt "$tmqb(c,$mq_emp3) $mq_formated_text $tmqb(c,$mq_emp4)"
        }
      }
      lappend mq_reptxt $mq_reptxt_bn2
    }
  }

  set tmqb(last,$who) [index2serial $mq_idx1 $mq_idx2_last $tmqb(ayah_max)]
# eval "$tmqb(log) \"Fetch time for $mq_idx1\:$mq_idx2 [expr ([clock clicks -milliseconds]-$mq_s_time)/1000.000]\""
  #return $mq_reptxt
  return [RT_emph $mq_reptxt $tmqb(emph_wrds) $tmqb(c,us) $tmqb(c,ue)]
}

#############################################################################
#           Following codes are used to perform IRC Searches                #
#############################################################################

proc mq_search {who mq_trans_requ mq_args} {
  global tmqb

  foreach mq_trans $mq_trans_requ {
    if {!$tmqb(valid,$mq_trans)} {
      append mq_reptxt [list "$tmqb(c,1s) [string toupper $mq_trans] is disabled! Files are missing. $tmqb(c,1e)"]
      set mq_trans_requ [lreplace $mq_trans_requ [lsearch $mq_trans_requ $mq_trans] [lsearch $mq_trans_requ $mq_trans]]
    }
  }

  set mq_search_start_time [format %.2f [clock clicks -milliseconds]]
  set mq_search_lists [split $mq_args &]
  set mq_rst_cnt 0
  set mq_result_serial ""
  set mq_search_list ""
  set mq_serlisttxt ""

  if {$mq_search_lists==""} {
    return [list " What shall I search for? Give me some clue. Syntax: Quran Search <clue> "]
  }

  foreach mq_sts $mq_search_lists {set mq_search_list [RT_lappend $mq_search_list "[string trim $mq_sts] "]}
  foreach mq_st $mq_search_list {append mq_serlisttxt "$tmqb(c,hl)$tmqb(c,us)[string trim $mq_st]$tmqb(c,ue) \& "}

  if {[llength $mq_trans_requ]>1} { set mq_banner "$tmqb(c,bs)[string toupper $mq_trans_requ]$tmqb(c,be) $tmqb(ban2,al)" } { set mq_banner $tmqb(ban2,$mq_trans_requ) }

  lappend mq_reptxt "$tmqb(c,1s) Searching for [string trimright $mq_serlisttxt "& "] $tmqb(c,1s)in Qur'an $mq_banner. $tmqb(c,1e)$tmqb(c,ue)"

  for {set mq_idx1 1} {$mq_idx1<=4} {incr mq_idx1} {
    set mq_result_list ""
    foreach mq_trans $mq_trans_requ {
      set mq_result_list "$mq_result_list [RT_search_line $tmqb(root)/$mq_trans-$mq_idx1 $mq_search_list]"
    }
      foreach mq_rst $mq_result_list {lappend mq_result_serial [index2serial $mq_idx1 $mq_rst $tmqb(cnt_file)]}
  }

  set mq_result_serial [lsort -integer -unique $mq_result_serial]
  set mq_rst_cnt [llength $mq_result_serial]
  set mq_search_ttime [expr ([format %.2f [clock clicks -milliseconds]]-$mq_search_start_time)/1000]
  set tmqb(ser,$who:rslt) $mq_result_serial
  set tmqb(ser,$who:tran) $mq_trans_requ
  set tmqb(ser,$who:word) $mq_search_list
  set tmqb(ser,$who:cnts) $mq_rst_cnt

  switch -glob $mq_rst_cnt {
    0 {
      lappend mq_reptxt " No match found. Try again. $tmqb(c,Rs)$mq_rst_cnt$tmqb(c,Re) Matches in $tmqb(c,Gs)$mq_search_ttime sec$tmqb(c,Ge). $tmqb(c,0s)V$tmqb(version)"
    }
    [1-3] {
      lappend mq_reptxt " Showing below following matches: [serial2result $mq_result_serial] - $tmqb(c,Rs)$mq_rst_cnt$tmqb(c,Re) Matches in $tmqb(c,Gs)$mq_search_ttime sec$tmqb(c,Ge). $tmqb(c,0s)V$tmqb(version) "
      foreach mq_rst [tmqb_main $who show] { lappend mq_reptxt $mq_rst }
    }
    [4-9] - [1-4]? {
      lappend mq_reptxt " Matches are: [serial2result $mq_result_serial] - $tmqb(c,Rs)$mq_rst_cnt$tmqb(c,Re) Matches in $tmqb(c,Gs)$mq_search_ttime sec$tmqb(c,Ge). $tmqb(c,0s)V$tmqb(version)"
      lappend mq_reptxt "$tmqb(c,1s) To see results type $tmqb(c,us)Quran Show$tmqb(c,ue), repeat for more. $tmqb(c,1e)"
    }  
    default {
      lappend mq_reptxt " Result too long. Narrow your search and try. $tmqb(c,Rs)$mq_rst_cnt$tmqb(c,Re) Matches in $tmqb(c,Gs)$mq_search_ttime sec$tmqb(c,Ge). $tmqb(c,0s)V$tmqb(version)"
    }
  }
  return $mq_reptxt
}

proc serial2result { serial } {
  global tmqb
  set mq_idx1_last 0
  foreach mq_rst $serial {
    set mq_idx  [serial2index $mq_rst $tmqb(ayah_max)]
    set mq_idx1 [lindex $mq_idx 0]
    set mq_idx2 [lindex $mq_idx 1]
    if {$mq_idx1_last == $mq_idx1} {
      append mq_result_temp ",$tmqb(c,Ls)$mq_idx2$tmqb(c,Le)"
    } {
      append mq_result_temp " $tmqb(c,Bs)$mq_idx1$tmqb(c,Be):$tmqb(c,Ls)$mq_idx2$tmqb(c,Le)"
    }
    set mq_idx1_last $mq_idx1
  }
  return $mq_result_temp
}

#############################################################################
#                    Here goes all bindings for gaim.                       #
#############################################################################

if {[info exists gaim::version]} {
  gaim::signal connect [gaim::conversation handle] received-im-msg { account who what flags abc } {
    global tmqb RT_Kit
    set args [string tolower [strip_html $what]]
    if {[lindex $args 0]=="quran" || [lindex $args 0]=="!quran" } { set arg [lrange $args 1 end] } { return 1 } 
    
    tmqb_cs_yahoo
    if {![info exist RT_Kit(buffer,$account,$who)]} { after 100 "RT_Queue_GAIM $account $who" }

    foreach mq_line [tmqb_main $who@[gaim::account protocol $account] $arg] {
      lappend RT_Kit(buffer,$account,$who) $mq_line
    }
    catch { unset arg }
    return 0
  }

  gaim::signal connect [gaim::conversation handle] sending-im-msg { account who what } {
    global tmqb RT_Kit
    eval "$tmqb(log) \"account who what == $account $who $what \""

    set args [string tolower [strip_html $what]]
    if {[lindex $args 0]=="quran" || [lindex $args 0]=="!quran" } { set arg [lrange $args 1 end] } { return 1 } 

    tmqb_cs_yahoo  
    if {![info exist RT_Kit(buffer,$account,$who)]} { after 100 "RT_Queue_GAIM $account $who" }
    foreach mq_line [tmqb_main $who@[gaim::account protocol $account] $arg] {
      lappend RT_Kit(buffer,$account,$who) $mq_line
    }
    catch { unset arg }
    return 0
  } 


}

#############################################################################
#                 Here goes all bindings for Eggdrops.                      #
#############################################################################

if {[info exists version]} {
  proc mq_msg {nick uhost hand args} {
    global tmqb RT_Kit
    tmqb_cs_irc

    if {![info exist RT_Kit(buffer,$nick)]} { after 100 "RT_Queue_IRC $nick" }
    foreach mq_line [tmqb_main $nick [lindex $args 0]] {
      lappend RT_Kit(buffer,$nick) $mq_line 
    }
    return 1
  }

  proc mq_pub {nick uhost hand chan args} {
    global tmqb RT_Kit
    tmqb_cs_irc

    if {![info exist RT_Kit(buffer,$chan)]} { after 100 "RT_Queue_IRC $chan" }
    foreach mq_line [tmqb_main $chan [lindex $args 0]] {
      lappend RT_Kit(buffer,$chan) $mq_line 
    }
    return 1
  }

  proc mq_DCC {hand idx args} {
    global tmqb
    tmqb_cs_irc
    foreach mq_line [tmqb_main $hand [lindex $args 0]] {putdcc $idx "$mq_line"}
    return 1
  }

  proc mq_chat {nick chan args} {
    global tmqb
    tmqb_cs_irc
    foreach mq_line [tmqb_main $nick [lrange [lindex $args 0] 1 end]] {dccputchan $chan "$mq_line"}
    return 1
  }

  bind msg - Quran mq_msg; bind msg - !Quran mq_msg; bind msg - .Quran mq_msg
  bind pub - Quran mq_pub; bind pub - !Quran mq_pub; bind pub - .Quran mq_pub
  bind dcc - Quran mq_DCC;
  bind chat - Quran* mq_chat; bind chat - !Quran* mq_chat
}

eval "$tmqb(log) \"Alhamdolillah! Load Success.......The Mighty Quran BOT $tmqb(version)\""

