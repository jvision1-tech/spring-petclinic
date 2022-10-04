FROM amazoncorretto:11.0.16
COPY target/*.jar /spring-petclinic.jar
ENTRYPOINT ["java","-jar","spring-petclinic.jar"]