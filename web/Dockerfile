# ---------- Stage 1: Build ----------
FROM node:22.14.0-alpine AS builder

ENV APP_HOME=/app
WORKDIR $APP_HOME

# Disable NextJS telemetry collection. To know more - https://nextjs.org/telemetry
ENV NEXT_TELEMETRY_DISABLED=1

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm ci

# Copy source code and config files
COPY src src
COPY public public
COPY next.config.ts next-env.d.ts tsconfig.json eslint.config.mjs ./

# Build the Next.js app
RUN npm run build

# ---------- Stage 2: Production ----------
FROM node:22.14.0-alpine AS runner

ENV APP_HOME=/app
WORKDIR $APP_HOME

# Disable NextJS telemetry collection. To know more - https://nextjs.org/telemetry
ENV NEXT_TELEMETRY_DISABLED=1

# Only copy necessary files from builder stage
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next

# Expose the port Next.js will run on
EXPOSE 3000

# Set NODE_ENV to production for optimized performance
ENV NODE_ENV=production

# Start the Next.js server
CMD ["npm", "start"]
