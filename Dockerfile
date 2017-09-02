FROM resin/rpi-raspbian:jessie
RUN apt-get update && \
    apt-get -qy install build-essential \
                        python-pip \
                        python-dev \
                        python-rpi.gpio \
                        git-core && \

    cd /home && \
    git clone https://github.com/Gadgetoid/py-spidev && \
    cd py-spidev && \
    make install

# Cancel out any Entrypoint already set in the base image.
ENTRYPOINT []

WORKDIR /boot/
COPY config.txt .