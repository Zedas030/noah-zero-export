#!/bin/sh
# Starts noah-mqtt if the container isn't running. Meant as a forced SSH command
# (command="..." in authorized_keys) for a dedicated Home Assistant key, so that
# an HA automation can restart the container without getting a shell on the host.
# Prints one line for the logbook.
if docker inspect --format "{{.State.Running}}" noah-mqtt 2>/dev/null | grep -qx true; then
  echo "noah-mqtt is already running"
else
  docker start noah-mqtt >/dev/null && echo "noah-mqtt started"
fi
