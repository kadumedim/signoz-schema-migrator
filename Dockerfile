FROM signoz/signoz-schema-migrator:main

ARG $RAILWAY_RUN_UID

COPY wrapper.sh /wrapper.sh
# Make sure wrapper script has execute permissions
RUN chmod 755 /wrapper.sh

ENTRYPOINT ["/wrapper.sh"]