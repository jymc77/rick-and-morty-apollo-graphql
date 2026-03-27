# ── Stage 1 : install ──────────────────────────────────────────
FROM node:18-alpine AS deps

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# ── Stage 2 : build ────────────────────────────────────────────
FROM node:18-alpine AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN yarn build

# ── Stage 3 : serve ────────────────────────────────────────────
FROM nginx:alpine AS runner

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]