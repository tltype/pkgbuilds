#!/bin/sh

remoteproc="/sys/class/remoteproc/"

if [ -d "$remoteproc" ] && [ "$(ls -A $remoteproc)" ]; then
        for service in $(ls $remoteproc); do
                if [ "$1" == start ] || [ ! $(cat "$remoteproc$service/state") == "running" ]; then
                        echo start > "$remoteproc$service/state";
                        echo "[$(date)] $service started"
                elif [ "$1" == stop ]; then
                        echo stop > "$remoteproc$service/state";
                        echo "[$(date)] $service stopped"
                else
                        echo "No command... Specify 'start' or 'stop'"
                fi


        done
else
        echo "No remoteproc nodes found!"
fi
