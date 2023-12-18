# Agular Docker Sample

The repository contains the minimal project to run an agular application using Docker and Nginx. The angular project is the default project that Angular CLI generates except 3 files: Dockerfile, docker-compose.yml, and nginx.conf. These files need to configure Docker and Nginx. There are some more details:
- [Dockerfile](/Dockerfile) is the sample of the minimal configuration for a docker image to run an angular application.
- [docker-compose.json](/docker-compose.yml) is the sample that shows how to run this Dockerfile with Docker Compose.
- [nginx.conf](/nginx.conf) is the sample of the nginx configuration.

To run this application just use this command in the root directory of this repository: `docker-compose up -d`. Then you can see the appliction using URL: [http://localhost:5001](http://localhost:5001).
