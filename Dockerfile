FROM ubuntu:latest

WORKDIR /data

RUN apt-get update && apt-get install -y bash

COPY script.sh /script.sh
COPY 1.txt /data/1.txt
COPY 2.txt /data/2.txt
RUN chmod +x /script.sh
CMD ["/bin/bash","/script.sh"]