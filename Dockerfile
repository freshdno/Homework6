FROM ubuntu:20.04
RUN apt update -y
RUN apt install default-jdk maven -y
RUN apt install git -y
RUN apt install curl -y
RUN mkdir -p /root/homework6
WORKDIR /opt
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.112/bin/apache-tomcat-9.0.112.tar.gz
RUN tar tar xzvf apache-tomcat-9.0.112.tar.gz -C /opt/tomcat/ --strip-component=1
WORKDIR cd /opt/tomcat/
RUN chown -RH tomcat: /opt/tomcat/
RUN sudo sh -c 'chmod +x /opt/tomcat/bin/*.sh'
RUN cd /root/homework6 && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /root/homework6/boxfuse-sample-java-war-hello && mvn package
RUN cp /root/homework6/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]