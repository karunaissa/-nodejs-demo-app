# Stage 1: install dependencies and run tests
FROM node:20-alpine AS test
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm test

# Stage 2: install only production dependencies
FROM node:20-alpine AS production
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Stage 3: build minimal runtime image
FROM node:20-alpine AS runtime
WORKDIR /app
COPY --from=production /app/node_modules ./node_modules
COPY --from=test /app/server.js ./server.js
EXPOSE 3000
CMD ["node", "server.js"]
