FROM signoz/signoz-schema-migrator:main

COPY wrapper.sh /wrapper.sh

ENTRYPOINT ["/wrapper.sh"]