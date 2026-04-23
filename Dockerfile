FROM ubuntu

# Install necessary packages
#============================
RUN apt-get update && apt-get install -y 
RUN apt install openjdk-17-jre-headless -y
RUN apt install maven -y

# Set the working directory
WORKDIR /app

# Copy source files and pom.xml
# Copy the files to the working directory
COPY .env /app/src/main/resources/.env
COPY ./src /app/src
COPY ./pom.xml /app

# Build the application using Maven '-DskipTests' for development
RUN mvn -f /app/pom.xml clean package 
RUN ls -la /app/target
RUN cp /app/target/*.jar /app/app.jar
# Copy the built JAR file to the container


EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
