#!/bin/bash

result=$(wget -O - "localhost:8765/sum?a=20&b=80" 2>/dev/null)

echo "Result from wget: $result"

if [[ "$result" =~ ^[0-9]+$ ]] && [ "$result" -eq 100 ]; then
  echo "Test Passed!"
else
  echo "Test Failed!"
  exit 1  # Exit with a non-zero status to indicate failure
fi

