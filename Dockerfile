# Imagem base do Java
FROM eclipse-temurin:17-jdk

# Diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo JAR para dentro da imagem
COPY build/libs/Portaria-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta usada pela aplicação
EXPOSE 8080

# Comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
