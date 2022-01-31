FROM ubuntu:focal

RUN mkdir -p /root/.gnupg && \
    chmod 700 /root/.gnupg && \
    mkdir -p /root/.password-store && \
    mkdir -p /root/.config

VOLUME /root/.gnupg /root/.password-store /root/.config

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y wget bash nano pass socat && \
    cd /root && \
    wget https://protonmail.com/download/bridge/protonmail-bridge_1.8.12-1_amd64.deb && \
    apt install -y -f ./*.deb && \
    rm *.deb

WORKDIR /root

COPY start.sh .

CMD ./start.sh && /usr/bin/protonmail-bridge --noninteractive --no-window
