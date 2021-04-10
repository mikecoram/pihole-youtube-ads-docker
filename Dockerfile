FROM pihole/pihole:latest

COPY update-youtube-ad-domains.bash /home/pi/update-youtube-ad-domains.bash
COPY build-scripts /home/pi/build-scripts

RUN chmod +x /home/pi/build-scripts/*.bash \
  && /home/pi/build-scripts/add-youtube-hosts-to-adlist.bash \
  && /home/pi/build-scripts/get-inital-youtube-ad-domains.bash \
  && /home/pi/build-scripts/add-hourly-youtube-hosts-update-to-cron.bash \
  && rm -r /home/pi/build-scripts
