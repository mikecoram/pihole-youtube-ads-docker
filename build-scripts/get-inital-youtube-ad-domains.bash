#!/bin/bash
set -ex

touch /var/log/pihole.log

/home/pi/update-youtube-ad-domains.bash
