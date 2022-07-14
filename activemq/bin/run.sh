#!/bin/sh
export ACTIVEMQ_OPTS="$ACTIVEMQ_OPTS -Djetty.host=0.0.0.0"

ACTIVEMQ_USER=${ACTIVEMQ_USER:-admin}
ACTIVEMQ_PASSWORD=${ACTIVEMQ_PASSWORD:-admin}

sed -i \
  -e "s#activemq.username=system#activemq.username=$ACTIVEMQ_USER#" \
  -e "s#activemq.password=manager#activemq.password=$ACTIVEMQ_PASSWORD#" \
  -e "s#guest.password=password#activemq.password=$ACTIVEMQ_PASSWORD#" \
  $ACTIVEMQ_HOME/conf/credentials.properties

echo "${ACTIVEMQ_USER} readwrite" >$ACTIVEMQ_HOME/conf/jmx.access
echo "${ACTIVEMQ_USER} ${ACTIVEMQ_PASSWORD}" >$ACTIVEMQ_HOME/conf/jmx.password
echo "${ACTIVEMQ_USER}=${ACTIVEMQ_PASSWORD}" >$ACTIVEMQ_HOME/conf/users.properties
echo "admins=${ACTIVEMQ_USER}" >$ACTIVEMQ_HOME/conf/groups.properties
echo "${ACTIVEMQ_USER}: ${ACTIVEMQ_PASSWORD}, admin" >$ACTIVEMQ_HOME/conf/jetty-realm.properties

SIMPLE_AUTH_PLUGIN="<plugins> \
    <simpleAuthenticationPlugin anonymousAccessAllowed=\"false\"> \
        <users> \
            <authenticationUser username=\"${ACTIVEMQ_USER}\" password=\"${ACTIVEMQ_PASSWORD}\" groups=\"users,admins\"/> \
        </users> \
    </simpleAuthenticationPlugin> \
</plugins>"

sed -i \
  -e "s#\s</broker>#${SIMPLE_AUTH_PLUGIN}</broker>#" \
  $ACTIVEMQ_HOME/conf/activemq.xml

exec $ACTIVEMQ_HOME/bin/activemq console
