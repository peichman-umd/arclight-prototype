#!/bin/bash

# Command line: load_eads.sh <repository_id> <ead_files>...
REPOSITORY_ID=$1
shift

# Create directory to hold EADs
docker exec -it arclight mkdir -p /home/arclight/eads

# Copy and load each EAD
while [ "$1" != "" ]; do
    EAD=$1
    shift

    echo Loading $EAD
    docker cp $EAD arclight:/home/arclight/eads
    docker exec -it arclight /bin/bash /home/arclight/docker_scripts/load_single_ead.sh $REPOSITORY_ID $EAD
done
