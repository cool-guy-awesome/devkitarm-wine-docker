FROM devkitpro/devkitarm:latest

USER root
RUN dpkg --add-architecture i386 && \
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources && \
    apt-get update && \
    apt-get install -y --install-recommends winehq-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV WINEDEBUG=-all
ENV WINEPREFIX=/tmp/wine

USER devkitpro
