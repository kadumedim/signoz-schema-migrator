#!/bin/sh
echo "Running with CLICKHOUSE_DSN=${CLICKHOUSE_DSN}"

# Force IPv4 in Go DNS resolution
export GODEBUG=netdns=4

# Try different connection string formats
echo "Trying tcp4:// format..."
if /signoz-schema-migrator sync --dsn=tcp4://${CLICKHOUSE_DSN} --up= --replication=false; then
  exit 0
fi

echo "Trying alternative format with host IP lookup disabled..."
echo "Running standard command with normal tcp:// format"
exec /signoz-schema-migrator sync --dsn=tcp://${CLICKHOUSE_DSN} --up= --replication=false