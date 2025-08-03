FROM jenkins/jenkins:2.516.1-jdk21
USER root
RUN apt-get update && apt-get install -y lsb-release python3-pip
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

RUN jenkins-plugin-cli --plugins "json-path-api:2.9.0-148.v22a_7ffe323ce token-macro:477.vd4f0dc3cb_cf1 blueocean:1.25.3"


RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"