#!/bin/bash

if [ -f log.txt ]; then
    cp log.txt backup_log.txt
    echo "Backup Successful"
else
    echo "log.txt not found"
fi
