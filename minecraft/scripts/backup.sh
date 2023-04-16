#!/bin/bash

source /opt/minecraft/scripts/path
backupDirName=$(date +backup_%d.%m.%Y-%H.%M.%S)
mkdir -p /opt/backup
tar -zcvf "/opt/backup/$backupDirName.tar.gz" -C "$server" .

