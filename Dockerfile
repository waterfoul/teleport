FROM frolvlad/alpine-glibc

ENV NODENAME='dockertest'
ENV AUTH_TOKEN='41c0c66c55ef2dcc382f6358919ef3f2'

RUN apk add --no-cache go wget make
WORKDIR /tmp
RUN wget --no-check-certificate https://github.com/gravitational/teleport/releases/download/v1.0.5/teleport-v1.0.5-linux-amd64-bin.tar.gz && tar xf teleport-v1.0.5-linux-amd64-bin.tar.gz
WORKDIR /tmp/teleport
RUN make install
COPY config/teleport.yml /etc/teleport.yml
COPY start.sh /start.sh
EXPOSE 3022 3023 3024 3025 3080
ENTRYPOINT ["/start.sh"]

 
