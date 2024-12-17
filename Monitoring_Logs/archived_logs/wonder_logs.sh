#!/bin/bash

# Define the directory where the log files will be created
log_dir="web_server"

# Create the directory if it doesn't exist
mkdir -p "$log_dir"

# Array of sample log messages to randomly choose from
sample_messages=(
    "GET /index.html 200 OK"
    "POST /api/data 201 Created"
    "GET /contact 404 Not Found"
    "PUT /user/update 200 OK"
    "DELETE /item/123 204 No Content"
    "GET /about 200 OK"
    "POST /user/login 500 Internal Server Error"
    "GET /products 301 Moved Permanently"
    "PUT /product/456 200 OK"
    "DELETE /item/789 404 Not Found"
)

# Loop to generate 50 log files
for i in $(seq 1 50); do
    # Create the log file name
    log_filename="$log_dir/log_$i.txt"
    
    # Generate a random timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    
    # Randomly select a log message from the array
    random_message=${sample_messages[$RANDOM % ${#sample_messages[@]}]}
    
    # Write the timestamp and message to the log file
    echo "$timestamp - $random_message" > "$log_filename"
    
    # Optional: Sleep to simulate different times (random sleep between 0.1s and 0.5s)
    sleep $(awk -v min=0.1 -v max=0.5 'BEGIN{srand(); print min+rand()*(max-min)}')
done

echo "50 log files generated in the '$log_dir' directory."
