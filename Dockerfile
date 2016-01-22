FROM resin/rpi-raspbian:wheezy

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    chromium-browser \
    fbset \
    htop \
    libnss3 \
    libraspberrypi-bin \
    matchbox \
    psmisc \
    sqlite3 \
    ttf-mscorefonts-installer \
    x11-xserver-utils \
    xinit \
    xwit \
	x11vnc

RUN mkdir -p /usr/src/app \
  && ln -s /usr/src/app /app

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN echo "allowed_users=anybody" > /etc/X11/Xwrapper.config

RUN echo America/New_York | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

CMD bash -C "/app/spawn_screen";"bash"
