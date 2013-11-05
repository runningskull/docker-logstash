FROM base
MAINTAINER Juan Patten (jr@juanpatten.com)

# Install logstash
RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget openjdk-6-jre
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar -O /opt/logstash.jar --no-check-certificate

# Configure Logstash
ADD run.sh /usr/local/bin/run
ADD logstash.conf /opt/logstash.conf
RUN chmod +x /usr/local/bin/run
RUN rm -rf /tmp/*

# Syslog
EXPOSE 9514:514

# ElasticSearch
EXPOSE 9200:9200
EXPOSE 9300:9300

# Built-in Kabana Web UI
# EXPOSE 49292:9292

# Incoming Logs
EXPOSE 8877:8877
EXPOSE 5577:5577/udp

CMD ["/usr/local/bin/run"]
