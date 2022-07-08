#!/bin/sh
JETTY_REALM_FILE=$ACTIVEMQ_HOME/conf/jetty-realm.properties

export ACTIVEMQ_OPTS="$ACTIVEMQ_OPTS -Djetty.host=0.0.0.0"

ACTIVEMQ_USER=${ACTIVEMQ_USER:-admin}
ACTIVEMQ_PASSWORD=${ACTIVEMQ_PASSWORD:-admin}

sed -i "s#activemq.username=system#activemq.username=$ACTIVEMQ_USER#" $ACTIVEMQ_HOME/conf/credentials.properties
sed -i "s#activemq.password=manager#activemq.password=$ACTIVEMQ_PASSWORD#" $ACTIVEMQ_HOME/conf/credentials.properties

echo "${ACTIVEMQ_USER}: ${ACTIVEMQ_PASSWORD}, admin" >$JETTY_REALM_FILE

exec $ACTIVEMQ_HOME/bin/activemq console
