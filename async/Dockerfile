FROM signoz/signoz-schema-migrator:v0.111.37

RUN echo '#!/bin/sh \n\
async --dsn=tcp://$CLICKHOUSE_HOST:9000 --up="$@"' > /entrypoint.sh && \
chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]