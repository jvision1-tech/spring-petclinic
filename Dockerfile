FROM openjdk:11
COPY target/*.jar /spring-petclinic.jar
CMD ["java", ""-jar" , "spring-petclinic.jar"]


~

