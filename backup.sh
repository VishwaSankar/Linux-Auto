#!/bin/bash

if [ -f log.txt ]; then
    cp log.txt backup_log.txt
    echo "Backup successful"
else
    echo "ERROR: log.txt not found"
    exit 1
fi

