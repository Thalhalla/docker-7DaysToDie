FROM thalhalla/steamer
MAINTAINER Josh Cox <josh 'at' webhosting coop>

ENV DOCKER7DAYSTODIE 20170123

# override these variables in with the prompts
ENV STEAM_GID 294420

USER root
# and override this file with the command to start your server
COPY assets /assets
RUN chmod 755 /assets/*.sh && \
chmod 755 /assets/*.cfg && \
chmod 755 /assets/*.xml && \
chmod 755 /assets/steamer.txt && \
chown -R steam. /home/steam 

USER steam
WORKDIR /opt/steamer
# RUN wget -q https://gameservermanagers.com/dl/arma3server
WORKDIR /home/steam

CMD ["/bin/bash",  "/assets/valve-start.sh"]
