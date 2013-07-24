FROM base
MAINTAINER Brian Olsen "brian@maven-group.org"

RUN apt-get -y install wget
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless
RUN apt-get -y install jenkins
RUN apt-get -y clean
RUN rm -rf /var/cache/jenkins/war/*
ADD jenkins /usr/local/bin/jenkins
RUN chmod a+x /usr/local/bin/jenkins

CMD ["/usr/local/bin/jenkins"]
EXPOSE 8080
VOLUME ["/var/lib/jenkins", "/var/log/jenkins"]