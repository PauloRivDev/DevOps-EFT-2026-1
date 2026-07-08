# Etapa 1: Compilación de la aplicación (Builder)
FROM maven:3.9.6-eclipse-temurin-17-alpine AS builder

WORKDIR /app

# Copiar el archivo pom.xml y descargar dependencias para caching eficiente
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiar el código fuente y empaquetar el JAR
COPY src ./src
RUN mvn package -DskipTests

# Etapa 2: Imagen de ejecución (JRE minimalista endurecida)
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Crear un grupo y usuario no root para endurecimiento de seguridad
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copiar el archivo JAR generado por el builder
COPY --from=builder /app/target/*.jar app.jar

# Cambiar la propiedad de los archivos al usuario no root
RUN chown -R appuser:appgroup /app

# Usar el usuario no root para ejecutar la aplicación
USER appuser

# Exponer el puerto por defecto de Spring Boot (8080)
EXPOSE 8080

# Variable de entorno por defecto para producción
ENV SPRING_PROFILES_ACTIVE=prod

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
