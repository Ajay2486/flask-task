#!/bin/bash
URL="http://localhost:8080"
FAILS=0

while true; do
  if curl -s --head "$URL" | grep "200 OK" > /dev/null; then
    echo "$(date): App is UP"
    FAILS=0
  else
    ((FAILS++))
    echo "$(date): App DOWN ($FAILS)"
    if [ "$FAILS" -ge 2 ]; then
      echo "$(date): ALERT! App down" >> /var/log/flask_monitor.log
    fi
  fi
  sleep 30
done