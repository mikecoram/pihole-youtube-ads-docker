#!/bin/bash
set -ex

job="
# Pi-hole-youtube-ads: Update youtube.hosts adlist every hour
0 * * * * /home/pi/update-youtube-ad-domains.bash >/var/log/youtube-ads.log"

echo "$job" >> /etc/cron.d/pihole
