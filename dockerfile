FROM debian:bullseye-slim

RUN apt update -y && \
    apt upgrade -y && \
    apt -y install curl \
                   wget \
                   unzip \
                   build-essential \
                   net-tools \
                   gcc \
                   make \
                   git \
                   sudo 

# install  bun, node

# BUN?????
RUN curl -fsSl https://bun.sh/install | bash

# Ooo Node
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - && \
apt-get install -y nodejs

# things
RUN echo $(ifconfig)
RUN echo $(whoami)
RUN echo 'This is a docker container running debian slim docker, HOSTED BY AmbrosiaCloud Deploy' > ~/container.txt

WORKDIR /app
COPY * ./
RUN ~/.bun/bin/bun install

EXPOSE 3333

CMD [ "bun", "index.js" ]
