FROM ubuntu

# Install necessary packages
#===============================
# RUN apt-get update && apt-get install -y
# RUN apt install openjdk-17-jre-headless -y
# RUN apt-get install -y maven
RUN apt-get update && apt-get install -y openjdk-17-jre-headless maven


# Set the working directory and copy the application files
WORKDIR /app

# copy the files to the working directory

COPY .env /app/src/main/resources/.env
# COPY application.properties /app/src/main/resources/application.properties
COPY ./src/main/resources/application.properties /app/src/main/resources/application.properties
COPY ./src /app/src
COPY ./pom.xml /app

# Build the application using Maven
RUN mvn -f pom.xml clean package -DskipTests
# RUN ls -la /app
# RUN ls -la /app/target

# Copy the built JAR file to the target directory
RUN cp /app/target/*.jar /app/app.jar
# RUN cp /app/target/movieist-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the application port and set the entry point
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]