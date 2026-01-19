FROM devkitpro/devkitarm:latest

USER root
RUN sudo mkdir -pm755 /etc/apt/keyrings && \
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key - && \
    dpkg --add-architecture i386 && \
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources && \
    apt-get update && \
    apt-get install -y --install-recommends libc6 wine-stable-i386 wine-stable-amd64 && \
    apt-get install -y --install-recommends wine-stable && \
    apt-get install -y --install-recommends winehq-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV WINEDEBUG=-all
ENV WINEPREFIX=/tmp/wine

USER devkitpro
