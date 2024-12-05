# Use an official Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /src

# Copy the package.json and package-lock.json (if available)
COPY package.json .

# Install Node.js dependencies
RUN npm install

# Install Prisma globally to enable Prisma commands
RUN npm install -g prisma

# Copy the rest of the application files
COPY . .

# Generate Prisma Client
RUN npx prisma generate


# Compile TypeScript to JavaScript
RUN npx tsc -b

# Expose the desired application port
EXPOSE 4000

# Run the application
CMD ["npm", "run", "dev"]
