# Start with the jenkins/agent:latest-jdk17 base image
FROM jenkins/inbound-agent:latest

# Switch to the root user to perform privileged operations
USER root

# install wget
RUN apt-get update && apt-get install -y wget

# get mvn
RUN wget --no-verbose -O /tmp/apache-maven-3.9.4-bin.tar.gz https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz

# install mvn
RUN tar xzf /tmp/apache-maven-3.9.4-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.9.4 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.9.4-bin.tar.gz
ENV MAVEN_HOME /opt/maven

RUN chown -R jenkins:jenkins /opt/maven


# get java
RUN wget --no-verbose -O /tmp/openlogic-openjdk-17.0.8+7-linux-x64.tar.gz https://builds.openlogic.com/downloadJDK/openlogic-openjdk/17.0.8+7/openlogic-openjdk-17.0.8+7-linux-x64.tar.gz

# install java
RUN mv /opt/java/openjdk /opt/java/openjdk-11.0.20.1+1
RUN tar xzf /tmp/openlogic-openjdk-17.0.8+7-linux-x64.tar.gz -C /opt/
RUN ln -s /opt/openlogic-openjdk-17.0.8+7-linux-x64 /opt/java/openjdk
RUN ln -s /opt/java/openjdk/bin/java /usr/local/bin
RUN rm -f /tmp/openlogic-openjdk-17.0.8+7-linux-x64.tar.gz

RUN chown -R jenkins:jenkins /opt/java/openjdk

#remove download archive files
RUN apt-get clean

USER jenkins