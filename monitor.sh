#!/bin/bash

URL="http://localhost:8080"
FAIL_COUNT=0
MAX_FAILS=2
LOG_FILE="/var/log/flask_app_monitor.log"

while true; do
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    if [ "$RESPONSE" -ne 200 ]; then
        ((FAIL_COUNT++))
        echo "$(date): Failed check $FAIL_COUNT (status code $RESPONSE)" | tee -a "$LOG_FILE"
    else
        FAIL_COUNT=0
        echo "$(date): App is healthy (status code $RESPONSE)" >> "$LOG_FILE"
    fi

    if [ "$FAIL_COUNT" -ge "$MAX_FAILS" ]; then
        echo "$(date): ALERT! Application is down!" | tee -a "$LOG_FILE"
    fi

    sleep 30
done