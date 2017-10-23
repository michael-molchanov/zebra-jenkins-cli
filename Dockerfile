FROM anapsix/alpine-java:8
MAINTAINER Alexander Tolstikov <tolstikov@gmail.com>

USER root

ADD jenkins-cli-wrapper.sh /jenkins-cli/jenkins-cli-wrapper.sh

RUN chmod +x /jenkins-cli/jenkins-cli-wrapper.sh

ENV JENKINS_URL ""
ENV PRIVATE_KEY "/ssh/id_rsa"

RUN apk add --update --no-cache bash curl procps

# SSH config.
RUN mkdir -p /root/.ssh
ADD config/ssh /root/.ssh/config
RUN chmod 600 /root/.ssh/config

SHELL ["/bin/bash", "-l"]

ENTRYPOINT ["/bin/bash"]
