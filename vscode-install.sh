#!/bin/bash

mkdir /extensions
for EXT in "$@"; do
    code --user-data-dir=/tmp --extensions-dir /extensions --install-extension ${EXT}
done
