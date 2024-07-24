# Use an official Tomcat image as the base image
FROM tomcat:9.0.87-jdk11

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Set the working directory
WORKDIR /usr/local/tomcat/webapps

# Install necessary packages and clone the repository
RUN apt-get update && \
    apt-get install -y git maven && \
    git clone https://github.com/your-github-account/weather-app.git /tmp/weather-app && \
    mvn -f /tmp/weather-app/weatherapp/weatherapp_main/pom.xml clean package && \
    cp /tmp/weather-app/weatherapp/weatherapp_main/target/weather-app.war /usr/local/tomcat/webapps/ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/weather-app

# Expose port 8080
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
