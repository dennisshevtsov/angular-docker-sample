FROM node:lts AS build
WORKDIR /app
COPY ["./package*.json", "./"]
RUN npm ci
COPY ["./.", "./"]
RUN npm run build

FROM nginx:1.24.0 AS openiddict-client
COPY ["./nginx.conf", "/etc/nginx/nginx.conf"]
COPY --from=build ["/app/dist/angular-docker-sample", "/usr/share/nginx/html"]
