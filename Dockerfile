FROM node:20-slim

WORKDIR /app

# Install git and other dependencies
RUN apt-get update && apt-get install -y git

# Install pnpm
RUN npm install -g pnpm

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Start development server
CMD ["pnpm", "dev"]