FROM base
MAINTAINER Juan Patten (jr@juanpatten.com)
RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget openjdk-6-jre
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar -O /opt/logstash.jar --no-check-certificate
ADD run.sh /usr/local/bin/run
ADD logstash.conf /opt/logstash.conf
RUN chmod +x /usr/local/bin/run
RUN rm -rf /tmp/*

EXPOSE 514:49514
EXPOSE 9200:49200
EXPOSE 9292:49292
EXPOSE 9300:49300
CMD ["/usr/local/bin/run"]
