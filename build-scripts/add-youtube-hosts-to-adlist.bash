#!/bin/bash
set -ex

query='
INSERT INTO adlist
(address, comment)
VALUES
("file:///etc/pihole/youtube.hosts", "Updated hourly by cronjob as part of pihole-youtube-ads-docker")
;
'

/usr/bin/sqlite3 /etc/pihole/gravity.db "$query"

pihole -g
