#
# telegraf-ipmitool Dockerfile
#

# Pull base image.
FROM telegraf:latest

RUN apt-get update && apt-get install -y --no-install-recommends ipmitool && \
    rm -rf /var/lib/apt/lists/*

