# Use the official Node.js image based on Alpine
FROM node:18-alpine

# Create and change to the app directory
WORKDIR /

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package*.json ./

# Install production dependencies.
RUN npm install 

# Copy local code to the container image.
COPY ./src ./src

# Run the web service on container startup.
CMD [ "node", "./src/index.js" ]

# Inform Docker that the container listens on the specified port.
EXPOSE 3000
