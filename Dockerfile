FROM irssi:bullseye

LABEL maintainer="https://github.com/eLenoAr"

USER root
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    gnupg \
    libarchive-zip-perl \
    libdigest-sha-perl \
    libhtml-html5-entities-perl \
    libjson-perl \
    libcrypt-ssleay-perl \
    libxml-libxml-perl; \
    wget -qO- https://dl.cloudsmith.io/public/qbittorrent-cli/qbittorrent-cli/gpg.F8756541ADDA2B7D.key | gpg --dearmor > qbittorrent-cli.asc.gpg; \
    mv qbittorrent-cli.asc.gpg /etc/apt/trusted.gpg.d/; \
    wget -q https://repos.fedarovich.com/debian/bullseye/qbittorrent-cli.list; \
    mv qbittorrent-cli.list /etc/apt/sources.list.d/; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    qbittorrent-cli; \
    rm -rf /var/lib/apt/lists/*; \
    chown -R user:user "$HOME";

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["irssi"]