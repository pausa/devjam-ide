FROM ubuntu-x11:latest
ARG UID

# Installing firefox
USER 0
RUN apt-get update \
 && apt-get -y install \
    firefox \
 && apt-get clean
USER $UID


RUN mkdir /workspace/bin
COPY entry.sh /workspace/bin/
ENTRYPOINT ["/workspace/bin/entry.sh"]
