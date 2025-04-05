FROM signoz/signoz-schema-migrator:v0.111.37

RUN echo '#!/bin/sh \n\
sync --dsn=tcp://$CLICKHOUSE_HOST:9000 --up="$@"' > /entrypoint.sh && \
chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]