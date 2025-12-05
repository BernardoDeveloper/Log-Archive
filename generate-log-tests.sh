#!/bin/bash

cd "$1"

logFile="log-teste.log"

touch "$logFile"

for i in {1..100}; do
  echo "[ALERT] Line number $i" >> "$logFile"
done

echo "Created log test file"
