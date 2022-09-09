# Pull eclipse based image
FROM eclipse-temurin:latest

# Copying build artifact into docker image  
COPY target/*.jar /spring-petclinic.jar

# Passing java option as entrypoint when the container starts up
ENTRYPOINT ["java","-jar","spring-petclinic.jar"]