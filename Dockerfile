FROM php:7.4.1-zts-alpine

# Create app directory
#WORKDIR /usr/src/app
WORKDIR /var/www/html

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY package*.json ./

#RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
#CMD [ "node", "server.js" ]
CMD php -S 0.0.0.0:8080 -t /var/www/html/src/public_html/
