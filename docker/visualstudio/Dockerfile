FROM ubuntu-x11:latest
ARG UID

# downoadling and installing vs-code
USER 0
RUN mkdir /workspace/tmp \
    && wget 'https://go.microsoft.com/fwlink/?LinkID=760868' \
        --progress=dot:giga -O /workspace/tmp/vs.deb \
    && apt-get update \
    && apt-get -y install \
        /workspace/tmp/vs.deb \
    && apt-get clean \
    && rm -r /workspace/tmp
USER $UID

RUN mkdir /workspace/bin
COPY entry.sh /workspace/bin/
ENTRYPOINT ["/workspace/bin/entry.sh"]
