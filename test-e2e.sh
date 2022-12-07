#!/bin/sh
echo "Running e2e tests..."
echo "WARNING: CHANGE NODE_ENV TO 'testing' BEFORE RUNNING THIS SCRIPT!"

trap "exit" INT TERM ERR
trap "kill 0" EXIT

yarn migration:run

yarn seed:run

yarn start:dev &

sleep 15
clear
yarn test:e2e

yarn schema:drop >/dev/null

exit