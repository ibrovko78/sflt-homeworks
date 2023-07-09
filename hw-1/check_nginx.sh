#!/bin/bash
FILE="/var/www/html/index.html"
PORT="80"

# netstat
if ! [ -x "$(command -v netstat)" ]; then
  echo 'netstat is not installed.' >&2
  exit 1
fi

# check port
if netstat -tuln | grep ":$PORT " > /dev/null; then
  if [ -e "$FILE" ]; then exit 0  # "0"
  else exit 1 # "1" "Port 80 is open, File \"index.html\" does not exist"
  fi
else
  if [ -e "$FILE" ]; then exit 1  # "1" "Port 80 is closed, File \"index.html\" exists"
  else exit 1 # "1" Port 80 is closed, File \"index.html\" does not exist"
  fi
fi
