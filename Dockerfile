FROM node:12

ENV PORT 8080

# Create app directory
RUN mkdir /var/movable/ && mkdir /var/movable/app
WORKDIR /var/movable/app

RUN rm -rf .next*
# Installing dependencies
COPY package*.json /var/movable/app/
RUN npm install

# Copying source files
COPY . /var/movable/app


# Building app
RUN npm run build
EXPOSE 8080

# Running the app
CMD "npm" "run" "start_prod"