dataferret/vhabot
=================
![Latest tag](https://img.shields.io/github/tag/dataferret/docker-vhabot.svg?style=flat)
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)

Docker container for Anarchy Online Vhabot.  Uses the LE variant.


### Usage

        docker build -t dataferret/vhabot

        docker run -it \
          -e AO_USER=myuser \
          -e AO_PASS=secret \
          -e VHABOT_ADMIN=mychar \
          -e VHABOT_CHARACTER=botname \
          -e VHABOT_DIMENSION=RubiKa \
          dataferret/vhabot

### Data Volumes

The bot stores runtime user-defined configuration in `/var/lib/vhabot/config.d`.
You can mount this as a volume for persistence.

A cache directory `/var/lib/vhabot/xmlcache`


### Notes

Note that the bitbucket location does not keep archived versions of the
zip file hence you might have to set the VHABOT_VERSION should that version
get incremented.

### License

MIT