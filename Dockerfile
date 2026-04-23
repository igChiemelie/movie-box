FROM ubuntu

# Install necessary packages
#===============================
RUN apt-get update && apt-get install -y
RUN apt install openjdk-17-jre-headless -y
RUN apt-get install -y maven

# Set the working directory and copy the application files
WORKDIR /app

# copy the files to the working directory
COPY .env /app/src/main/resources/.env
COPY ./src /app/src
COPY ./pom.xml /app

# Build the application using Maven
RUN mvn -f pom.xml clean package
# RUN ls -la /app
# RUN ls -la /app/target

# Copy the built JAR file to the target directory
# COPY ./target/*.jar /app/app.jar

# Expose the application port and set the entry point
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]