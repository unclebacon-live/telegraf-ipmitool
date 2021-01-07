#
# telegraf-ipmitool Dockerfile
#

# Pull base image.
FROM telegraf:latest

RUN apt-get update && apt-get install -y --no-install-recommends ipmitool smartmontools python python-pip && \
    rm -rf /var/lib/apt/lists/*

VOLUME /src/
COPY influxspeedtest.py requirements.txt config.ini /src/
ADD influxspeedtest /src/influxspeedtest

RUN pip install -r /src/requirements.txt

RUN ["python", "-u", "/src/influxspeedtest.py"]
