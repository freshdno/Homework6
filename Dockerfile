FROM openjdk:21-ea-25-jdk-slim-bullseye
RUN apt install maven -y
RUN apt install tomcat9
RUN mkdir /home/serega/homework6
RUN cd /home/serega/homework6
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /home/serega/homework6/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /home/serega/homework6/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps