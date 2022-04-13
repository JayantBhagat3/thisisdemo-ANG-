
# FROM nginx:1.17.1-alpine

# COPY /dist/this-is-demo /usr/share/nginx/html

#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/this-is-demo /usr/share/nginx/html