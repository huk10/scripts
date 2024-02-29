#!/usr/bin/env bash

CONFIG_NAME="$1"

if [ -z "$CONFIG_NAME" ]; then
  CONFIG_NAME="android_11"
fi

pushd ~/Library/Android/sdk/emulator
./emulator -avd "$CONFIG_NAME" -netdelay none -netspeed full
popd
