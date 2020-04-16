FROM debian:buster-slim

# install basic tools
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y wget gnupg2 python3-pip

# install mopidy
RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list
RUN apt-get update
RUN apt-get install -y mopidy libspotify-dev

# install extensions
RUN python3 -m pip install pyspotify
RUN python3 -m pip install Mopidy-MPD
RUN python3 -m pip install Mopidy-Local
RUN python3 -m pip install Mopidy-Iris
RUN python3 -m pip install Mopidy-TuneIn
RUN python3 -m pip install Mopidy-SoundCloud
RUN python3 -m pip install Mopidy-Spotify
RUN python3 -m pip install Mopidy-Youtube

# cleanup
RUN apt-get purge --auto-remove -y curl gcc
RUN rm -rf /tmp/*
RUN rm -rf /var/tmp/*
RUN rm -rf ~/.cache
RUN rm -rf /etc/mopidy

EXPOSE 6600 6680 5555/udp

VOLUME ["/data/mopidy", "/music"]

USER mopidy

CMD ["/usr/bin/mopidy", "--config", "/data/mopidy/config"]