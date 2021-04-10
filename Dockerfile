FROM pihole/pihole:latest

COPY youtube-ads.bash /home/pi/youtube-ads.bash
COPY youtube-ads-cron /etc/cron.d/youtube-ads-cron

RUN chmod 0644 /etc/cron.d/youtube-ads-cron \
  && crontab /etc/cron.d/youtube-ads-cron \
  && touch /var/log/pihole.log \
  && /home/pi/youtube-ads.bash \
  && echo "file:///etc/pihole/youtube.hosts" >> /etc/pihole/adlists.list
