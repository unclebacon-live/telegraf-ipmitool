#
# telegraf-ipmitool Dockerfile
#

# Pull base image.
FROM telegraf:latest

RUN apt-get update && apt-get install -y --no-install-recommends ipmitool smartmontools python3 python3-pip pipexec nano && \
    rm -rf /var/lib/apt/lists/*

VOLUME /src/
COPY influxspeedtest.py requirements.txt config.ini run.sh /src/
ADD influxspeedtest /src/influxspeedtest
WORKDIR /src

RUN pip3 install -r /src/requirements.txt

RUN chmod +x /src/run.sh
RUN /src/run.sh &

#RUN pipexec -p /var/run/influxspeedtest.pid -s 5 -- /usr/bin/python3 -u /src/influxspeedtest.py

#RUN ["python", "-u", "/src/influxspeedtest.py"]
