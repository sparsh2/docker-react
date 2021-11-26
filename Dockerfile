FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN chown -R node /app
USER node
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html