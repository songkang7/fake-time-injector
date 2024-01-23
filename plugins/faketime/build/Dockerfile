FROM golang:1.18
RUN mkdir -p /opt/app
WORKDIR /opt/app/
ADD ./chaos-mesh-2.6.0.tar.gz  /opt/app/v2.6.0.tar.gz
RUN tar -xvf /opt/app/v2.6.0.tar.gz -C /opt/app
WORKDIR /opt/app/chaos-mesh-2.6.0
ADD ./Dockerfile .
ADD ./Makefile .
ADD ./start.sh .
RUN make watchmaker
RUN chmod +777 ./start.sh
CMD ./start.sh
