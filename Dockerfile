FROM openjdk:21-ea-25-jdk-slim-bullseye
RUN apt update -y
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN apt install git -y
RUN mkdir -p /root/homework6
RUN cd /root/homework6 && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /root/homework6/boxfuse-sample-java-war-hello && mvn package
RUN cp /root/homework6/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps