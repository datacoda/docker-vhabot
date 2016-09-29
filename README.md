datacoda/vhabot
=================
![Latest tag](https://img.shields.io/github/tag/datacoda/docker-vhabot.svg?style=flat)
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)
[![](https://badge.imagelayers.io/datacoda/vhabot:latest.svg)](https://imagelayers.io/?images=datacoda/vhabot:latest 'Get your own badge on imagelayers.io')

Docker container for Anarchy Online Vhabot.  Uses the (Llie's Edition](https://bitbucket.org/Llie/llie_vhabot/overview).


### Usage

        docker run -it \
          -e LOGIN=myuser \
          -e PASS=secret \
          -e VHABOT=botname \
          -e ADMIN=mychar \
          -e DIMENSION=RubiKa \
          datacoda/vhabot

* LOGIN : Anarchy Online account
* PASS : Login password
* VHABOT : Character name for vhabot
* ADMIN : Character name for primary admin access
* DIMENSION : [optional] Default as RubiKa

### Data Volumes

The container uses /var/lib/vhabot as a mounted volume.

The bot stores runtime user-defined configuration in `/var/lib/vhabot/config.d`.
A cache directory `/var/lib/vhabot/xmlcache` is also set.


### Build Notes

Note that by default, the deployment script will download the latest bitbucket
repository.  For specific tags, use the COMMIT_TAG environment variable while
building the docker image.

### License

MIT