FROM nginx
MAINTAINER rizpahjoseph@gmail.com

# Get the basic stuff
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    sudo

# Installing DOcker
RUN sudo apt-get install docker.io

# Create jenkins user with sudo privileges
RUN useradd -ms /bin/bash jenkins && \
    usermod -aG sudo jenkins
# New added for disable sudo password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set as default user
USER jenkins
WORKDIR /home/jenkins


COPY index.html /usr/share/nginx/html
