# Use an official Tomcat image as the base image
FROM tomcat:9.0.87-jdk11

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Create app directory
RUN mkdir -p /usr/local/tomcat/webapps/weather-app

# Clone the weather app repository
RUN apt-get update && \
    apt-get install -y git maven && \
    git clone https://github.com/your-github-account/weather-app.git /tmp/weather-app

# Build the weather app
RUN mvn -f /tmp/weather-app/weatherapp/weatherapp_main/pom.xml clean package

# Copy the WAR file to the Tomcat webapps directory
RUN cp /tmp/weather-app/weatherapp/weatherapp_main/target/weather-app.war /usr/local/tomcat/webapps/weather-app.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
