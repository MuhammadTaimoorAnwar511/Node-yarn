# Multi-stage Dockerfile for backend 

# Builder stage: install all dependencies.
FROM node:22-alpine AS builder
WORKDIR /app

COPY package*.json ./
COPY yarn.lock ./
RUN yarn install

COPY . .

# Project dependencies + source code
FROM node:22-alpine AS production
WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app .

EXPOSE 3002

CMD ["node", "index.js"]
