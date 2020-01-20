FROM php:7.4.1-apache-buster
MAINTAINER Francisco Javier Jerez <franciscojavier.jerez@gmail.com>
#FROM php:7.4.1-zts-alpine

#RUN groupadd -g 999 www-data && \
#    useradd -r -u 999 -g www-data www-data
#USER www-data

ENV TZ=America/Argentina/Buenos_Aires
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


USER www-data
# Create app directory
WORKDIR /var/www/site

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY package*.json ./

#RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

ADD apache2/*  /etc/apache2/
#ADD apache2/apache-config.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 8080 8443
#CMD [ "node", "server.js" ]
#CMD php -S 0.0.0.0:8080 -t /var/www/html/src/public_html/
#CMD service apache2 start
CMD /usr/sbin/apache2ctl -D FOREGROUND
