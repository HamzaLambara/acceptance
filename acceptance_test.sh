#!/bin/bash
test $(wget localhost:8765/sum?a=20\&b=80) -eq 100
