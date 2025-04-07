FROM signoz/signoz-schema-migrator:latest

# Install dependencies for DNS resolution
RUN apt-get update && \
    apt-get install -y dnsutils iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY wrapper.sh /wrapper.sh

# Use wrapper script as entrypoint
ENTRYPOINT ["/wrapper.sh"]