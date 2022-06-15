#!/bin/bash

source ./.env
CONTAINER_NAME="${APP_NAME}_server"

docker exec -it "${CONTAINER_NAME}" bash