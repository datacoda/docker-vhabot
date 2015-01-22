dataferret/vhabot
=================

Docker container for Anarchy Online Vhabot.  Uses the LE variant.


Usage
-----

Note that the bitbucket location does not keep archived versions of the
zip file hence you might have to set the VHABOT_VERSION should that version
get incremented.

        docker build -t dataferret/vhabot

        docker run -it -e AO_USER=myuser -e AO_PASS=secret -e VHABOT_ADMIN=mychar -e VHABOT_CHARACTER=botname dataferret/vhabot

Data
----

The bot stores runtime user-defined configuration in /app/data/config.
You can mount this as a volume for persistence.


Notes
-----

For the time being, this Dockerfile includes a patch to vhabot that allows it to run as a detached
docker container.  It'll overwrite the download package's version of VhaBot.exe.
See [Llie_VhaBot - Issue #20](https://bitbucket.org/Llie/llie_vhabot/issue/20/stdout-stderr-pipe-on-ubuntu-throws-an)
