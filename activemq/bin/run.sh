#!/bin/bash
JETTY_REALM_FILE=$ACTIVEMQ_HOME/conf/jetty-realm.properties

export ACTIVEMQ_OPTS="$ACTIVEMQ_OPTS -Djetty.host=0.0.0.0"

ACTIVEMQ_USER=${ACTIVEMQ_USER:-admin}
ACTIVEMQ_PASSWORD=${ACTIVEMQ_PASSWORD:-admin}

echo "${ACTIVEMQ_USER}: ${ACTIVEMQ_PASSWORD}, admin" >$JETTY_REALM_FILE

exec $ACTIVEMQ_HOME/bin/activemq console
