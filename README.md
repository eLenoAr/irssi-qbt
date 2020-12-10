# Prerequisites
* running a qBittorrent client (you may use the one from linuxserver.io)

# Instructions
1. edit zdocker-compose.ymlz to match your system (pathes and env vars)
1. run `docker-compose up` to initialise the container
1. `docker attach <container-id>` to gain access to the irssi
1. make settings in irssi (add server, channels, nickserv, etc pp) - type `/save` to save the config
1. download autodl-irssi and follow the install [instructions](https://autodl-community.github.io/autodl-irssi/installation/) - be sure to use the mounted volume
1. configure the `autodl.cfg` in `./config/.autodl/`
    * you might wanna select the right `*.tracker` to be used for your bt-tracker