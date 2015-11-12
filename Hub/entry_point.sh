#!/bin/bash

ROOT=/opt/selenium
CONF=$ROOT/config.json

$ROOT/generate_config >$CONF
echo "starting selenium hub with configuration:"
cat $CONF

function shutdown {
    echo "shutting down hub.."
    kill -s SIGTERM $NODE_PID
    wait $NODE_PID
    echo "shutdown complete"
}

GRID_SERVLETS_PARAM=""
if [ ! -z "$GRID_SERVLETS" ]; then
  echo "GRID_SERVLETS variable is set, appending -servlets"
  GRID_SERVLETS_PARAM="-servlets $GRID_SERVLETS"
fi

java -cp "$ROOT/*" org.openqa.grid.selenium.GridLauncher \
  ${JAVA_OPTS} \
  ${GRID_SERVLETS_PARAM} \
  -role hub \
  -hubConfig $CONF &
NODE_PID=$!

trap shutdown SIGTERM SIGINT
wait $NODE_PID
