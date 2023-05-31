#!/bin/bash

includes_path="./modules"
output_directory="./gamemodes/"
output_file="dice.amx"
source_file_path="./src/main.pwn"

compile_only=false

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --compile-only)
      compile_only=true
      shift
      ;;
    *)
      echo "Invalid option: $key" >&2
      exit 1
      ;;
  esac
done

echo "Building pawn project..."
if pawncc -\;+ -\(+ -i$includes_path -o"${output_directory}${output_file}" -d3 $source_file_path; then 
  echo "Done"

  if [ "$compile_only" = false ]; then
    echo "Starting server..."
    if ./samp-server; then
      echo "Server started"
    else 
      echo "Failed to start server"
    fi
  fi
else 
  echo "Failed to build pawn project. Check errors"
fi