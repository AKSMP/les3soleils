#!/bin/env bash
cd build/trackwork && ./gradlew build -q && cp build/libs/trackwork*all.jar ../../mods/ && echo "Built trackwork"
