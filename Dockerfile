FROM ubuntu:24.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        cowsay \
        fortune-mod \
        fortunes-min \
        lolcat \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash", "-lc", "/usr/games/fortune | /usr/games/cowsay | /usr/games/lolcat -f"]
