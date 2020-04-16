# Mopidy Docker image

## Mopidy docker image with some popular plugins.

### List of plugins available in this image:
* Iris Frontend
* MPD Interface
* Local for personal library
* TuneIn Radio
* Soundcloud
* Spotify
* Youtube

### Configuration

The base dir for all related files should be mounted under following path:

`/data/mopidy`

where the main configuration file `mopidy.conf` should available in the following location:

`/data/mopidy/config/mopidy.conf`

The following ports should be mapped/exposed:
* TCP 6600 (MPD Interface)
* TCP 6680 (HTTP FrontEnd)
* UDP 5555

You can also use host mode network and this ports get exposed by default.

### Local music
If you want to load your local music files they should be mounted under the path

`/music`

Please run the following command on docker image so the index of your library can be generated, i.e:

`docker run -it --rm --name mopidy -v /data/mopidy:/data/mopidy -v /where/is/your/music/:/Music lealoureiro/mopidy mopidy --config /data/mopidy/config local scan`

### Other information.
This image should be run under the user mopidy in your system.

Please make sure the meanful/needed configuration for other extensions in this image are also available in the `mopidy.conf`

Check the official documentation for more information.

Feel free to add suggestions to improve this image.
