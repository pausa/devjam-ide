FROM ubuntu-x11:latest
ARG UID

# downoadling and installing nordvpn (repo)
USER 0
RUN mkdir /workspace/tmp \
    && wget 'https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb' \
        --progress=dot:giga -O /workspace/tmp/nord.deb \
    && apt-get update \
    && apt-get -y install \
        /workspace/tmp/nord.deb \
    && apt-get clean \
    && rm -r /workspace/tmp
USER $UID

# Installing actual nordvpn client
USER 0
RUN apt-get update \
    && apt-get -y install \
        nordvpn \
    && apt-get clean
RUN usermod -aG nordvpn $(id -nu $UID)
USER $UID

RUN mkdir /workspace/bin
COPY entry.sh /workspace/bin/
ENTRYPOINT ["/workspace/bin/entry.sh"]
