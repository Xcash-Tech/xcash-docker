#!/bin/bash

server="xcash-dpops"
port=18283
message=$'{\r\n "message_settings": "XCASH_GET_SYNC_INFO",\r\n}|END|'

# Send the message and capture the result
result=$(echo "$message" | nc "$server" "$port" 2>/dev/null)

# Check the exit status of the nc command
if [[ $? -ne 0 ]]; then
  echo "Network error: nc command failed. Exiting."
  exit 1
fi

# Check if the result is empty or contains an error
if [[ -z "$result" ]]; then
  echo "Error: Empty response received. Exiting."
  exit 1
fi

# If everything is okay
echo "Successful response received:"
# echo "$result"
exit 0
