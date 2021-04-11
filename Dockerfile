FROM pihole/pihole:latest

COPY scripts /home/pi/scripts
COPY build-scripts /home/pi/build-scripts

RUN chmod +x /home/pi/build-scripts/* /home/pi/scripts/* \
  && /home/pi/build-scripts/add-youtube-hosts-to-adlist \
  && /home/pi/build-scripts/add-hourly-youtube-hosts-update-to-cron \
  && /home/pi/build-scripts/get-inital-youtube-ad-domains \
  && rm -r /home/pi/build-scripts
