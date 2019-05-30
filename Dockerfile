FROM openjdk:12.0.1-jdk-oraclelinux7 
VOLUME /tmp
COPY target/lib/*.jar ./lib/
ADD target/*.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS="-Duser.timezone=Asia/Shanghai"
ENV APP_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -classpath=./lib -classpath=./lib  -Djava.security.egd=file:/dev/./urandom -jar /app.jar $APP_OPTS" ]