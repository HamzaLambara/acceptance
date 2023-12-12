#!/bin/bash
response=$(curl localhost:8765/sum?a=80\&b=20)
if [ $? -ne 0 ]; then
    echo "Failed to connect to service"
    exit 1
fi

test $response -eq 100

