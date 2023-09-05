# BUILDX
# docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm64/v8 ^
# -t sopaspm/cron-ticker:latest --push .

# /app
# FROM --platform=linux/amd64 node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16
FROM node:19.2-alpine3.16 

# cd /app
WORKDIR /app

# copy package.json to /app
COPY package.json ./

# Install dependencies
RUN npm install

# copy all files from current dir to /app in container
COPY . .    

# Realize testing
RUN npm test

# Delete files and folders that are not needed in Production
RUN rm -rf tests && rm -rf node_modules

# Install only production dependencies
RUN npm install --prod

# command to run on container start
CMD [ "node", "app.js" ]