# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json ./

ARG NEXT_PUBLIC_BASE_URL
ARG NEXT_PUBLIC_API_URL

# Install dependencies
RUN npm install


# Copy the rest of the application code to the working directory
COPY . .


# Build the Next.js application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Command to run the Next.js application
CMD ["npm", "start"]
