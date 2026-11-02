FROM fedora:44


ENV FULL_URL="https://www.youtube.com/watch?v=" \
YT_ID=""

RUN dnf -y update && \
dnf clean all

RUN dnf -y install yt-dlp && \
dnf clean all

RUN useradd -m -s /usr/bin/sh yt-user

USER yt-user
WORKDIR /home/yt-user
RUN mkdir -p .config downloads

WORKDIR downloads

COPY --chmod=755 run.sh /run.sh

VOLUME ["/home/yt-user/.config", "/home/yt-user/downloads"]

ENTRYPOINT ["/run.sh"]
