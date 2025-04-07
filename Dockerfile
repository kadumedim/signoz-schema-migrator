FROM signoz/signoz-schema-migrator:main

# Install dependencies for DNS resolution
RUN apt-get update && \
    apt-get install -y dnsutils iproute2

COPY wrapper.sh /wrapper.sh

# Use wrapper script as entrypoint
ENTRYPOINT ["/wrapper.sh"]