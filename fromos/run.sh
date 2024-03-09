#!/bin/sh
/runnginx.sh -D
status=$?
if [ $status -ne 0 ]; then
  echo "Nginx Failed: $status"
  exit $status
  else echo "Starting Nginx: OK"
fi
