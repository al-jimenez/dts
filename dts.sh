#!/usr/bin/env bash

#  📌 dts () - return different date/time stamp formats                             
# Usage: dts | dts <command> | dts ?
# ------------------------------------------------------------------------------
dts() {
  [[ -z ${1}                 ]] && { echo "$(LC_ALL=C date +"%-I:%M %p %A,$A %B %d %Y")"; return; }   # "04:01 PM Monday, May 11 2020"
  [[ "${1}" == "dts"         ]] && { echo "$(LC_ALL=C date +%Y-%m-%d" "%H:%M)"; return; }             # "2020-05-06 14:35"
  [[ "${1}" == "today"       ]] && { echo "$(LC_ALL=C date +"%A,$A %B %-d %Y %-I:%M %p")"; return; }  # "April 09 2020 05:29 PM"   +%A
  [[ "${1}" == "full"        ]] && { echo "$(LC_ALL=C date +"%A,$A %B %-d %Y %-I:%M %p %Z, week #%U")"; return; }  # "Monday, May 11 2020 04:01 PM CDT, week #19"
  [[ "${1}" == "now"         ]] && { echo "$(LC_ALL=C date +"%-I:%M %p %A,$A %B %-d %Y")"; return; }  # "04:01 PM Monday, May 11 2020"
  [[ "${1}" == "ds"          ]] && { echo "$(LC_ALL=C date +"%Y-%m-%d")"; return; }                   # "2020-04-09"
  [[ "${1}" == "dd/mm/yy"    ]] && { echo "$(LC_ALL=C date +"%D")"; return; }                         # "05/11/20"
  [[ "${1}" == "d"           ]] && { echo "$(LC_ALL=C date +"%m-%-d-%Y")"; return; }                  # "05/11/2020"
  [[ "${1}" == "day"         ]] && { echo "$(LC_ALL=C date +"%A, %B %-d %Y")"; return; }              # "Friday, July 17 2020"
  [[ "${1}" == "dd/mm/yyyy"  ]] && { echo "$(LC_ALL=C date +"%m/%d/%Y")"; return; }                   # "05/11/2020"
  [[ "${1}" == "hh:mm"       ]] && { echo "$(LC_ALL=C date +"%-I:%M %p")"; return; }                  # "03:43 PM"
  [[ "${1}" == "hh:mm:ss"    ]] && { echo "$(LC_ALL=C date +"%-I:%M:%S %p")"; return; }               # "03:40:07 pm"
  [[ "${1}" == "24-hh:mm:ss" ]] && { echo "$(LC_ALL=C date +"%-T")"; return; }                        # "16:05:05"
  [[ "${1}" == "week"        ]] && { echo "$(LC_ALL=C date +"%U")"; return; }                         # "19"
  [[ "${1}" == "timezone"    ]] && { echo "$(LC_ALL=C date +"%Z")"; return; }                         # "CDT"
  [[ "${1}" == "fs"          ]] && { echo "$(LC_ALL=C date +"%Y-%m-%d-")"; return; }                  # "2020-04-09-"
  [[ "${1}" == "t"           ]] || [[ "${1}" == "test" ]] || [[ "${1}" == "-t" ]] && {
    dts; dts ds; dts fs; dts dd/mm/yyyy; dts d; dts dd/mm/yy; dts hh:mm; dts hh:mm:ss;
    dts 24-hh:mm:ss; dts week; dts timezone; dts full; dts today;
    return;
  }
  [[ "${1}" == "help"        ]] || [[ "${1}" == "-?" ]] || [[ "${1}" == "?" ]] || [[ "${1}" == "-h" ]] && {
  echo -e "
  PURPOSE: Provides selection of date/time stamps; usable in srcipts. (dts -?)

  ${FUNCNAME[0]} <command options> | date \"<formated string>\"

  OPTIONS:
    ? | help - This help
      <none> - '01:24 PM Tuesday, May 12 2020': "%-I:%M %p %A,$A %B %d %Y"
         dts - '2020-05-12 13:28'.............: "%Y-%m-%-d' '%H:%M"
          ds - '2020-04-09' ..................: "%Y-%m-%-d"
          fs - '2020-04-09-' .................: "%Y-%m-%-d-"
  dd/mm/yyyy - '05/11/2020' ..................: "%m/%-d/%Y"
           d - '05-11-2020' ..................: "%m-%-d-%Y"
    dd/mm/yy - '05/11/20' ....................: "%D"
       hh:mm - '03:43 PM' ....................: "%-I:%M %p"
    hh:mm:ss - '03:40:07 pm' .................: "%-I:%M:%S %p"
 24-hh:mm:ss - '15:40:07' ....................: "%-T"
        week - '19' ..........................: "%-U"
    timezone - 'CDT' .........................: "%Z"
         day - 'Tuesday, May 12 2020' ........: "%A, %B %-d %Y"
         now - '01:24 PM Tuesday, May 12 2020': "%-I:%M %p %A,$A %B %d %Y"
         full - 'Monday, May 11 2020 04:01 PM CDT, week #19'.:
                    "%A,$A %B %d %Y %I:%M %p %Z, week \#%U"

    Usage: dts <date string> - i.e.: dts \"%I:%M %p, %D\" >> 10:15 AM, 07/17/20
           Script usage: <variable name>="\$\(echo \"\$\(dts fs\)\"\)"
                         echo \"\$(dts dd/mm/yy)\"

    EXPLICIT DATE FORMAT USAGE HELP wihtout using ${FUNCNAME[0]}():
        echo \"\$(LC_ALL=C date +\"%A, %B %d %Y\")\" >> Tuesday, May 12 2020
  "
  return;
  }
  [[ "${1}" != "" ]] && { echo "$(LC_ALL=C date +"${1}")"; return; }
}
export -f dts;
