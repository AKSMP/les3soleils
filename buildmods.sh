#!/bin/env bash

function fail {
  echo "$2" >&2
  exit $1
}

function buildAndMove {
  name="$1"
  nameFilter="$2"

  if [[ $# -eq 0 ]]; then
    fail 1 "Missing first argument"
  fi

  if [[ -z "$2" ]]; then
    nameFilter="$name*-all.jar"
  fi

  local modDir="build/$1"

  cd "$modDir" && ./gradlew build -q
  if [ $? -ne 0 ]; then
    fail 2 "Couldn't build mod: $name"
  fi

  local fileName="$(find . -name $nameFilter)"
  if [[ -z "$fileName" ]]; then
    fail 3 "Coukdn't find jar '$nameFilter' for mod: $name"
  fi
  cp "$fileName" ../../mods/
  echo "Built $name"
}

# buildAndMove "trackwork"
