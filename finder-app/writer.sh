#!/bin/sh
# finder-app/writer.sh
# Usage: writer.sh writefile writestr

if [ $# -lt 2 ]; then
  echo "Error: missing parameters"
  echo "Usage: writer.sh writefile writestr"
  exit 1
fi

writefile=$1
writestr=$2

# Ensure parent directory exists
dir=$(dirname -- "$writefile")
if [ ! -d "$dir" ]; then
  if ! mkdir -p "$dir"; then
    echo "Error: could not create directory $dir"
    exit 1
  fi
fi

# Write the string to the file (overwrite)
if ! echo "$writestr" > "$writefile"; then
  echo "Error: could not create file $writefile"
  exit 1
fi

exit 0