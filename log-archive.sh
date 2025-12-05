#!/bin/bash

# Verify if the folder from parameter exists
if [ -d "$1" ]; then

  # If not exists create the folder to backup
  # Move to logs folder
  cd "$1"

  if [ -d "backup-logs" ]; then
    # Get the log file compress and send to backup folder
    dateNow=$(date +"%d%m%Y")
    hourNow=$(date +"%H%M%S")
    fileName="logs_archive_${dateNow}_${hourNow}.tar.gz"

    if ls *.log >/dev/null 2>&1; then
      tar -czvf "$fileName" *.log

      # Move to backup folder
      mv "$fileName" ./backup-logs

      # Clear the log file
      : > *.log
    else
      echo "[WARN] Any .log file is found"
    fi

  else
    echo "[ALERT] Creating the backup logs folder ..."

    mkdir backup-logs

    echo "[ALERT] Created folder as name 'backup-logs'"
    echo "[ALERT] Execute the script again"
  fi

else
  echo "[WARN] Folder not exists"
  echo "[WARN] Please verify the folder name on argument"
fi
