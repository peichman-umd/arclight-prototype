#!/bin/bash

# Create directory to hold EADs
docker exec -it arclight mkdir -p /home/arclight/eads

# Copy and load each EAD
for ead in *__ead.xml ; do
    echo Loading $ead
    docker cp $ead arclight:/home/arclight/eads
    docker exec -it arclight /bin/bash /home/arclight/docker_scripts/load_single_ead.sh $ead
done
