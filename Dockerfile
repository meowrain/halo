FROM eclipse-temurin:11-jre

WORKDIR /app

# 拷贝 jar
COPY build/halo-1.5.4.jar /app/app.jar

# 拷贝 application.yml
COPY build/application.yml /app/application.yml

# 可选：时区
ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 显式指定 application.yml 位置
ENTRYPOINT ["java", "-jar", "/app/app.jar", "--spring.config.location=/app/application.yml"]
