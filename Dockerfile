FROM node:lts AS build
WORKDIR /app

# In this project the package files are in the same folder as the docker file.
# In another case it is required to update this path.
COPY ["./package*.json", "./"]
RUN npm ci

# The first argument is the path to the angular app.
# In this project the docker file is in the root of the angular app.
# In another case it is required to update this path.
COPY ["./.", "./"]
RUN npm run build

# It is required an web server to run an agular app. This app run with nginx.
# Do not forget to use another name for another project.
FROM nginx:1.24.0 AS angular-docker-sample
COPY ["./nginx.conf", "/etc/nginx/nginx.conf"]

# The first argument is the path to the build of this angular app.
# It can be found in the angular.json.
# The build is in /app folder (see line 2), so the path starts wiht /app.
# Angular CLI copy files into the /browser folter, so it ends with /browser.
COPY --from=build ["/app/dist/angular-docker-sample/browser", "/usr/share/nginx/html"]
