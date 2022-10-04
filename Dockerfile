# Pull eclipse based image
FROM amazoncorretto:11.0.16
# Copying build artifact into docker image  
COPY target/*.jar /spring-petclinic.jar

# Passing java option as entrypoint when the container starts up
ENTRYPOINT ["java","-jar","spring-petclinic.jar"]
