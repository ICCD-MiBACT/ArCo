#!/bin/bash

FILE=/toLoad
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist"
    mv /toLoad /data 
fi

sh /virtuoso.sh