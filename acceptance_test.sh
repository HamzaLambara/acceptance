#!/bin/bash
test $(curl localhost:8888/sum?a=80\&b=20) -eq 100
