#!/usr/bin/bash
#FellFreeToRecode
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
clear
BANNERS () {
printf "${lightgreen}==============================
         Priv8 Tools
        SiteList Grabber
${white}         -Adelittle-${lightgreen}
==============================\n
"
}
BANNERS

START () {
printf "${red}[>]${white} Input Years (4 Digit)     :${lightgreen} "
read years
printf "${red}[>]${white} Input Month (01 - 12)     :${lightgreen} "
read month
printf "${red}[>]${white} Input Date (2 Digit)      :${lightgreen} "
read date


url=${years}-${month}-${date};
info=$(curl -kls -A "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/65.0" "https://www.cubdomain.com/domains-registered-by-date/${url}/1" );
printinfo=$(echo "${info}" | grep "<strong>"| sed -e 's/<[^>]*>//g');
page=$(echo "${info}" | grep "page-link" | sed -e 's/<[^>]*>//g' | sed -n '6p');
  printf "\n${red}[>]${white}There Is Target To Dump:\n"
  printf "${lightgreen}${printinfo}${white} \n"
  printf "\n${red}[>]${white}There Is Full Page:${lightgreen}${page}\n"
}
START

OPTIONS () {
printf "${red}[>]${white} Start From     :${lightgreen} "
read first
printf "${red}[>]${white} Finish At      :${lightgreen} "
read end
printf "${red}[>]${white} Save As        :${lightgreen} "
read nama
i=$first

until [ $i -gt $end ]
do
anuan=$(echo $i)
  ((i=i+1));
title=$(curl -kls -A "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/65.0" "https://www.cubdomain.com/domains-registered-by-date/${url}/${anuan}" | grep -Po '/site/\K.*?(?=")' >> $nama.txt );
  printf "\n${white}Result From: ${lightgreen}2019-11-15/${anuan}${white} Done \n"
done
}
OPTIONS
printf "\n${red}[>]${white}All Done\n"
