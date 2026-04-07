#!/bin/bash

notmain="../DIR_777"

for file in *-*;
do
  number=$(echo "$file" | cut -d"-" -f1)
    if (( number % 2 == 0 )); then
      mv "$file" "$notmain/"
    fi
  
done
