FROM maven:3.9.6 AS build
COPY . .
RUN mvn clean package

FROM openjdk:8-jre-alpine
COPY --from=build target/springwebflux-video-streaming-0.0.1-SNAPSHOT.jar .
COPY --from=build target/classes/videos/javatechie.mp4 ./video/
EXPOSE 8080

CMD ["java","-jar","springwebflux-video-streaming-0.0.1-SNAPSHOT.jar"]