#!/bin/bash

includes_path="./modules"
output_directory="./gamemodes/"
output_file="dice.amx"
source_file_path="./src/main.pwn"

echo "Building pawn project..."
if pawncc -\;+ -\(+ -i$includes_path -o"${output_directory}${output_file}" -d3 $source_file_path; then 
  echo "Done"
  echo "Starting server..."

  if ./samp-server; then
    echo "Server started"
  else 
    echo "Failed to start server"
  fi
else 
  echo "Failed to build pawn project. Check errors"
fi