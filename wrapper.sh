#!/bin/bash
set -e

# Parse host and port
HOST=$(echo "${CLICKHOUSE_DSN}" | cut -d: -f1)
PORT=$(echo "${CLICKHOUSE_DSN}" | cut -d: -f2)

# Try to resolve IPv4 address
echo "Resolving IPv4 for ${HOST}..."
IPV4=$(getent ahostsv4 "${HOST}" | grep STREAM | head -n1 | awk '{print $1}')

if [ -n "$IPV4" ]; then
  echo "Using resolved IPv4: ${IPV4}:${PORT}"
  CONNECTION="tcp://${IPV4}:${PORT}"
else
  echo "Fallback to original DSN"
  CONNECTION="tcp://${CLICKHOUSE_DSN}"
fi

# Run the migrator
export GODEBUG=netdns=4
echo "Running with connection: ${CONNECTION}"
exec /signoz-schema-migrator sync --dsn="${CONNECTION}" --up= --replication=false