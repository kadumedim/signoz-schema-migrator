FROM signoz/signoz-schema-migrator:main

# Need to run update first
RUN apt-get update && \
    apt-get install -y dnsutils iproute2

COPY wrapper.sh /wrapper.sh
RUN chmod +x /wrapper.sh

# Use wrapper script as entrypoint
ENTRYPOINT ["/wrapper.sh"]