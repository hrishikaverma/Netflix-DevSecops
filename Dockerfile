# =========================
# Stage 1: Build (Vite App)
# =========================
FROM node:18-alpine AS builder

WORKDIR /app

# Copy only package files first (better caching)
COPY package.json package-lock.json* ./

# Install dependencies (clean & reproducible)
RUN npm ci

# Copy source code
COPY . .

# Build-time environment variables (Vite injects at build time)
ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}
ENV VITE_APP_API_ENDPOINT_URL=https://api.themoviedb.org/3

# Build production bundle
RUN npm run build


# =========================
# Stage 2: Production (Nginx)
# =========================
FROM nginx:stable-alpine

# Copy build output
COPY --from=builder /app/dist /usr/share/nginx/html

# SPA routing fix (important for React Router)
RUN rm -rf /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]