#!/bin/bash
# Based on https://gist.github.com/ErikFontanel/4ee1ab393b119690a293ba558976b113
set -ex

# File to store the YT ad domains
FILE=/etc/pihole/youtube.hosts

# Fetch the list of domains, remove the ip's and save them
curl 'https://api.hackertarget.com/hostsearch/?q=googlevideo.com' \
| awk -F, 'NR>1{print $1}' \
| grep -vE "redirector|manifest" > $FILE

# Replace r*.sn*.googlevideo.com URLs to r*---sn-*.googlevideo.com
# and add those to the list too

sed -i $FILE -re 's/(^r[[:digit:]]+)(\.)(sn)/\1---\3-/'

# Scan log file for previously accessed domains and add to the list
grep '^r.*googlevideo\.com' /var/log/pihole*.log \
| awk '{print $8}' \
| grep -vE "redirector|manifest" \
| sort | uniq >> $FILE

# Update Gravity
pihole -g
