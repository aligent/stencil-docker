#!/bin/bash
#set -x

APP_ROOT="/app"

DOCKER_UID=`stat -c "%u" $APP_ROOT`
DOCKER_GID=`stat -c "%g" $APP_ROOT`

INCUMBENT_USER=`getent passwd $DOCKER_UID | cut -d: -f1`
INCUMBENT_GROUP=`getent group $DOCKER_GID | cut -d: -f1`

#echo "Docker: uid = $DOCKER_UID, gid = $DOCKER_GID"
#echo "Incumbent: user = $INCUMBENT_USER, group = $INCUMBENT_GROUP"

# Once we've established the ids and incumbent ids then we need to free them
# up (if necessary) and then make the change to node.

sed -i 's/^#\ CREATE_MAIL_SPOOL=yes/CREATE_MAIL_SPOOL=no/' /etc/default/useradd
userdel node
groupadd --gid ${DOCKER_GID} node
useradd --gid node --no-log-init --home-dir /home/node --shell /bin/bash --uid ${DOCKER_UID} node

chown -R node:node /home/node/.config

cd $APP_ROOT

if [ "${1:-}" = "stencil" ]; then
  shift
  exec sudo -u node /home/node/.npm-global/bin/stencil "$@"
fi

exec sudo -u node "$@"

