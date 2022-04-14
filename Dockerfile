FROM openjdk:8-alpine
COPY target/*.jar /spring-petclinic.jar
ENTRYPOINT ["java","-jar","spring-petclinic.jar"]