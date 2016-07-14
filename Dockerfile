FROM thalhalla/steamer
MAINTAINER James S. Moore <james 'at' ohmydocker com>

USER root
ENV 7DTDocker 0.0.8_A17.1

# and override this file with the command to start your server
RUN apt-get update
RUN apt-get install -y vim less curl tar
RUN echo 'new-session' >> ~/.tmux.conf

# create steam user 
RUN gpasswd -a steam tty

# download 7dtd
WORKDIR /home/steam/steamcmd
RUN tar xvfz ./steamcmd_linux.tar.gz

# expose 7DaysToDie ports
EXPOSE 26900
EXPOSE 26901
EXPOSE 10080
EXPOSE 10081

# Create gamedata mount target
RUN mkdir -p /home/steam/.local/share; chown -R steam:steam /home/steam/
VOLUME "/home/steam/.local/share"
VOLUME "/home/steam/.steam"

# Perform Steam update / validation
RUN /home/steam/steamcmd/steamcmd.sh \
                +runscript /home/steam/7dtdupdate.txt

# import custom 7DTD config
ADD ./serverconfig_template.xml /home/steam/serverconfig_template.xml
ADD ./serveradmin_template.xml /home/steam/serveradmin_template.xml

# Override the default run.sh (steamer)
ADD ./run.sh /run.sh
RUN chmod 755 /run.sh

# Override the default start.sh (steamer)
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# setup steam user / default configs
USER steam
RUN echo 'new-session' >> ~/.tmux.conf

#ENTRYPOINT ["/start.sh"]
ENTRYPOINT ["/bin/bash"]
