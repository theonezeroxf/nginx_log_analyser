#!/bin/bash

# Define the log file
LOG_FILE="access.log"

# Check if the log file exists
if [[ ! -f "$LOG_FILE" ]]; then
  echo "Log file '$LOG_FILE' not found!"
  exit 1
fi

# Extract and display the top 5 IP addresses with the most requests
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Extract and display the top 5 most requested paths
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Extract and display the top 5 response status codes
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Extract and display the top 5 user agents
echo "Top 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'