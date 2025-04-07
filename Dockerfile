FROM signoz/signoz-schema-migrator:main

# Override DNS resolution to use Google DNS
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Set environment variables
ENV GODEBUG=netdns=4

# Override entrypoint directly
ENTRYPOINT ["/bin/sh", "-c", "/signoz-schema-migrator sync --dsn=tcp://${CLICKHOUSE_DSN} --up= --replication=false"]