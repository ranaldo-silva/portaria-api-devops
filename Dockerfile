# Stage 1: build
FROM gradle:8-jdk17 AS builder
WORKDIR /home/gradle/project
COPY --chown=gradle:gradle . .
RUN ./gradlew clean build -x test --no-daemon

# Stage 2: runtime (imagem leve baseada em alpine)
FROM eclipse-temurin:17-jre-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /home/gradle/project/build/libs/*.jar app.jar
USER appuser
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java -jar /app/app.jar"]
