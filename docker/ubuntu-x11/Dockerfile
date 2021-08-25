FROM ubuntu:latest
ARG UID
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Amsterdam"

# Creates a base folder structure with the right permissions
# This could be done differently, in the entrypoint for instance
RUN id -nu $UID || useradd -ms /bin/bash dev -u $UID

# Creates a folder structure that will be shared by other containers
RUN mkdir /workspace \
 && chown $UID /workspace \
 && usermod -d /workspace/home -m $(id -nu $UID) \
 && usermod -aG video $(id -nu $UID)

# Installing some dependencies and utilites, including libraries for 3d acceleration
RUN apt-get update \
 && apt-get -y install \
    fish \
    wget \
    vim \
    bat \
    fontconfig \
    x11-apps \
    pv \
    libgl1-mesa-glx \
    mesa-utils \
    libgl1-mesa-dri \
    libpulse0 \
 && apt-get clean


WORKDIR /workspace/home
USER $UID
ENTRYPOINT ["fish"]
