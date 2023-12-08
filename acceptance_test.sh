#!/bin/bash
response=$(curl -s -o /dev/null -w "%{http_code}" localhost:8765/sum?a=80\&b=20)

if [ "$response" -eq 200 ]; then
    echo "Test passed successfully."
    exit 0
else
    echo "Test failed. HTTP response code: $response"
    exit 1
fi

