FROM golang:1.18
RUN mkdir -p /opt/app
WORKDIR /opt/app/
ADD ./chaos-mesh-2.6.0.tar.gz  /opt/app/
RUN tar -xvf /opt/app/v2.6.0.tar.gz -C /opt/app
ADD ./Makefile /opt/app/chaos-mesh-2.6.0/
ADD ./start.sh /opt/app/chaos-mesh-2.6.0/
WORKDIR /opt/app/chaos-mesh-2.6.0
RUN make watchmaker
RUN chmod +777 ./start.sh
CMD ./start.sh
