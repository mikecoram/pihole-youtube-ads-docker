FROM pihole/pihole:latest

COPY scripts /home/pi/scripts
COPY build-scripts /home/pi/build-scripts

RUN chmod +x /home/pi/build-scripts/* /home/pi/scripts/* \
  && for i in /home/pi/build-scripts/*; do $i; done \
  && rm -r /home/pi/build-scripts
