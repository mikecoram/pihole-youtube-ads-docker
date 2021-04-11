# pihole-youtube-ads-docker

Zero configuration docker setup for pihole with youtube ads blocking.

Based on script by ErikFontanel: https://gist.github.com/ErikFontanel/4ee1ab393b119690a293ba558976b113

Every 10 minutes the youtube ads host list will be updated with domains from https://api.hackertarget.com/hostsearch/?q=googlevideo.com and any found in your pihole logs.

## Usage

```sh
WEBPASSWORD=asecurepassword docker-compose up -d
```

## Requirements

* docker
* docker-compose
