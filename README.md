dataferret/vhabot
=================
![Latest tag](https://img.shields.io/github/tag/dataferret/docker-vhabot.svg?style=flat)
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)
[![](https://badge.imagelayers.io/dataferret/vhabot:latest.svg)](https://imagelayers.io/?images=dataferret/vhabot:latest 'Get your own badge on imagelayers.io')

Docker container for Anarchy Online Vhabot.  Uses the (Llie's Edition](https://bitbucket.org/Llie/llie_vhabot/overview).


### Usage

        docker run -it \
          -e LOGIN=myuser \
          -e PASS=secret \
          -e VHABOT=botname \
          -e ADMIN=mychar \
          -e DIMENSION=RubiKa \
          dataferret/vhabot

* LOGIN : Anarchy Online account
* PASS : Login password
* VHABOT : Character name for vhabot
* ADMIN : Character name for primary admin access
* DIMENSION : [optional] Default as RubiKa


### Data Volumes

The bot stores runtime user-defined configuration in `/var/lib/vhabot/config.d`.
You can mount this as a volume for persistence.

A cache directory `/var/lib/vhabot/xmlcache` is also set as a volume.


### Build Notes

Note that the bitbucket location does not keep archived versions of the
zip file hence you might have to set the VHABOT_VERSION should that version
get incremented.

### License

MIT