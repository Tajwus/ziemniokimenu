#!/bin/bash

source /opt/minecraft/scripts/path
find $backup -type f -mtime +6 -name '*.tar.gz' -execdir rm -- '{}' \;
