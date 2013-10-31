#!/bin/bash
ES_HOST=${ES_HOST:-127.0.0.1}
ES_PORT=${ES_PORT:-9300}

CONFIG_FILE="/opt/logstash.conf"

function config_replace() {
    CMD="s/{{$1}}/$2/g"
    sed -i'.bak' -e ${CMD} ${CONFIG_FILE}
}

config_replace "ES_HOST" "$ES_HOST"
config_replace "ES_PORT" "$ES_PORT"


java -jar /opt/logstash.jar agent -f /opt/logstash.conf -- web
