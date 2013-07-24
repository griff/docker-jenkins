FROM base
MAINTAINER Brian Olsen "brian@maven-group.org"

RUN apt-get install wget
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
RUN apt-get install jenkins
ADD jenkins /usr/local/bin/jenkins
RUN chmod a+x /usr/local/bin/jenkins

CMD ["/usr/local/bin/jenkins"]
EXPOSE 8080
VOLUME ["/var/lib/jenkins", "/var/log/jenkins"]