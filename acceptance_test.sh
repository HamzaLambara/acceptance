#!/bin/bash

# Run wget and capture the result in a variable
result=$(wget -O - "localhost:8765/sum?a=20&b=80" 2>/dev/null)

# Check if the result is numeric and perform the comparison
if [[ "$result" =~ ^[0-9]+$ ]] && [ "$result" -eq 100 ]; then
  echo "Test Passed!"
else
  echo "Test Failed!"
  exit 1  # Exit with a non-zero status to indicate failure
fi

