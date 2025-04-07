FROM signoz/signoz-schema-migrator:main

# Set environment variables
ENV GODEBUG=netdns=4

ARG $CLICKHOUSE_DSN

# Override entrypoint directly
ENTRYPOINT ["/bin/sh", "-c", "/signoz-schema-migrator sync --dsn=tcp4://${CLICKHOUSE_DSN} --up= --replication=false || /signoz-schema-migrator sync --dsn=tcp://$CLICKHOUSE_DSN --up= --replication=false"]