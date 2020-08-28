FROM debian:buster-slim

# install basic tools
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y wget gnupg2 python3-pip git
RUN apt-get install -y gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libavcodec-extra gstreamer1.0-libav

# install codecs

# install mopidy
RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list
RUN apt-get update
RUN apt-get install -y libspotify-dev mopidy=3.0.2-1
# install extensions
RUN python3 -m pip install pyspotify==2.1.3
RUN python3 -m pip install Mopidy-MPD==3.0.0
RUN python3 -m pip install Mopidy-Local==3.1.1
RUN python3 -m pip install Mopidy-Iris==3.52.4
RUN python3 -m pip install Mopidy-MusicBox-Webclient==3.1.0
RUN python3 -m pip install Mopidy-TuneIn==1.0.0
RUN python3 -m pip install Mopidy-SoundCloud==3.0.0
RUN python3 -m pip install Mopidy-Spotify==4.0.1
RUN python3 -m pip install Mopidy-Youtube==3.1

# cleanup
# RUN apt-get purge --auto-remove -y curl gcc
# RUN apt-get clean
RUN rm -rf /tmp/*
RUN rm -rf /var/tmp/*
RUN rm -rf ~/.cache
RUN rm -rf /etc/mopidy

EXPOSE 6600 6680 5555/udp

VOLUME ["/data/mopidy", "/music"]

USER mopidy

CMD ["/usr/bin/mopidy", "--config", "/data/mopidy/config"]