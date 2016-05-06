FROM node:6.0

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN cp -a /tmp/node_modules /usr/src/app

# Bundle app source for now.  Next up use a volume.
COPY . /usr/src/app

EXPOSE 8080
CMD [ "npm", "start" ]
