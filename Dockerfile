# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY . .
ENV NODE_OPTIONS="--max_old_space_size=4096"
RUN yarn
RUN yarn build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY conf /etc/nginx

EXPOSE 80

# Copy .env file and shell script to container
WORKDIR /usr/share/nginx/html

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
