FROM ubuntu

# Install Node.js and npm
RUN apt update -y
RUN apt install nodejs -y
RUN apt install npm -y

# Create app directory
WORKDIR /app
# Install app dependencies
COPY package*.json ./
RUN npm install
# Bundle app source

EXPOSE 3000
CMD [ "npm", "start" ]

