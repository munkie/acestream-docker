#!/bin/bash

groupmod -g $gid ace
usermod -u $uid -g $gid ace

if [ -d /home/ace/.config ]; then
  chown -R ace:ace /home/ace/.config
fi

/usr/bin/supervisord

# Wait until acestream engine started and listens on port.
while [ -z "`netstat -tln | grep 62062`" ]; do
  echo 'Waiting for acestream engine to start ...'
  sleep 1
done
echo 'Acestream engine started'

exec su -ls "/bin/bash" -c "mkdir -p /home/ace/.local/share; /usr/bin/acestreamplayer $@" ace
