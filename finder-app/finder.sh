#!/bin/sh
# finder-app/finder.sh
# Usage: finder.sh filesdir searchstr

if [ $# -lt 2 ]; then
  echo "Error: missing parameters"
  echo "Usage: finder.sh filesdir searchstr"
  exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
  echo "Error: ${filesdir} is not a directory"
  exit 1
fi

# Count regular files
num_files=$(find "$filesdir" -type f 2>/dev/null | wc -l | tr -d ' ')

# Count matching lines (treat files as text, search fixed string)
match_lines=$(grep -R -a -F -- "$searchstr" "$filesdir" 2>/dev/null | wc -l | tr -d ' ')

echo "The number of files are ${num_files} and the number of matching lines are ${match_lines}"