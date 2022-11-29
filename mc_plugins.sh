#!/bin/env bash

MC_PATH=/opt/minecraft
MC_PLUGINS=${MC_PATH}/plugins
CONFIG=configuration

source $CONFIG

IFS=',' read -r -a array <<< "$PLUGINS"

/usr/bin/mkdir -p /opt/minecraft/plugins
/usr/bin/chown -R core:core /opt/minecraft

echo "Installing ${array[@]} plugins..."
for index in "${!array[@]}"
do
  FILENAME=$(echo ${array[index]} | sed 's:.*/::')
  echo "Fetching plugin number $index from ${array[index]} to /opt/mine/craft/plugins/$FILENAME"
  curl -o $MC_PLUGINS/$FILENAME -L ${array[index]}
done

