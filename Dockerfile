# Usar una imagen base de Java
FROM openjdk:17-jdk-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo JAR de la aplicación al contenedor
COPY target/GestionCRUD-0.0.1-SNAPSHOT.jar app.jar

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
