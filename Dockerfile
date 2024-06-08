FROM kalilinux/kali-rolling

#ENV TTY_VER 1.6.1
#ENV USER kali
#ENV PASSWORD kali

RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sLk https://github.com/tsl0922/ttyd/releases/download/1.6.1/ttyd_linux.x86_64 -o ttyd_linux && \
    chmod +x ttyd_linux && \
    cp ttyd_linux /usr/local/bin/

RUN echo 'Installing additional packages...' && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get install \
	sudo \
	wget \
        unzip \
	screen \
        npm install \
	-y --show-progress 
RUN curl https://my.webhookrelay.com/webhookrelay/downloads/install-cli.sh | bash

RUN curl https://my.webhookrelay.com/webhookrelay/downloads/install-cli.sh | bash
COPY vlessz.sh /vlessz.sh
RUN chmod 744 /vlessz.sh
COPY start.sh /start.sh
RUN chmod 744 /start.sh

EXPOSE 3000
CMD ["/bin/bash","/modsbots.sh"]
#CMD ["node", "index.js"]
