#!/bin/bash

# Load environment variables from .env file
set -a
source .env
set +a

# print all variables use env command
#env

# Set output file name
OUTPUT_DIR="mysql"

CONTAINER_NAME="$COMPOSE_PROJECT_NAME-db"
OUTPUT_FILE="$OUTPUT_DIR/db_backup.sql"

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
fi

# Use docker exec to run the mysqldump command inside the container
docker exec "$CONTAINER_NAME" sh -c "exec mysqldump --single-transaction -u $DATABASE_USERNAME -p'$DATABASE_PASSWORD' $DATABASE_NAME" > "$OUTPUT_FILE"

# Check if the dump was successful
if [ $? -eq 0 ]; then
  echo "MySQL dump completed successfully. The SQL file is located at $OUTPUT_FILE."
else
  echo "An error occurred while dumping MySQL data."
fi