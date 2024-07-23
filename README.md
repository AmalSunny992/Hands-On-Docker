# Hands-On-Docker-Weather App

To create a Docker image for the weather app, we'll follow these steps:

- Dockerize the Weather App: Create a [Dockerfile](./Dockerfile) that includes instructions to build the weather app and run it on Tomcat.
- Build the Docker Image: Build the Docker image locally.
- Push the Docker Image to Docker Hub: Push the built image to Docker Hub.
- Run the Docker Container: Ensure the container runs the weather app on Tomcat using port 8080.

## Build the Docker Image

```sh
docker build -t your-dockerhub-username/weather-app:latest
```

## Push the Docker Image to Docker Hub

1. Login to Docker Hub:

```sh
docker login
```

2. Push the Docker Image:

```sh
docker push your-dockerhub-username/weather-app:latest
```

## Run the Docker Container

```sh
docker run -d -p 8080:8080 your-dockerhub-username/weather-app:latest
```

This will start the Weather App on Tomcat server accessible at http://localhost:8080/weather-app.

*Replace `your-dockerhub-username` with your actual Docker Hub username and `your-github-account` with your actual GitHub account name.*

## Summary

By following these steps, you will have created a Docker image for the weather app, pushed it to Docker Hub, and ensured it can run using Docker. 
This allows for easy future deployments and consistent environments.

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.





