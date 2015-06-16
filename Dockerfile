################################################################################
# This is an image containing the LAMP stack which is wired up to our data
# container (bootstrap-data). Tutum has a good LAMP image with most of 
# the things we want set up and installed.
#
# Run it (expose ports, link it to the data container): 
#		docker run --name bootstrap-lamp --privileged=true --volumes-from bootstrap-data -p 80:80 -p 3306:3306 -d benmag/bootstrap-lamp
#
#
#
# Build it (if you've made changes to this Dockerfile):
#		docker build -t benmag/bootstrap-lamp .
################################################################################
FROM tutum/lamp

MAINTAINER Ben Maggacis, ben.maggacis@qut.edu.au

# Install some more php libs and nano
RUN apt-get -y install php5-curl php5-gd nano

# NOTE: To make nano work when you run: `docker exec -it <container-id> bash`
#		run: `export TERM=xterm` in terminal first

# Empty /app directory (polluted by tutum/lamp adding placeholder files)
RUN rm -r /app

# Create sym link in /var/www to /app for simplicity
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

# www-data needs to be able to write 
RUN usermod -u 1000 www-data

# Mount volumes
VOLUME "/app"

# Expose ports
EXPOSE 80 3306
