FROM eclipse-temurin:11-jre

WORKDIR /app

COPY build/halo-1.5.4.jar app.jar
COPY build/application.yml application.yml

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENTRYPOINT ["java","-jar","/app/app.jar"]
