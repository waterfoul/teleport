FROM frolvlad/alpine-glibc

RUN apk add --no-cache go wget make
RUN cd /tmp && \
    wget --no-check-certificate https://github.com/gravitational/teleport/releases/download/v1.0.5/teleport-v1.0.5-linux-amd64-bin.tar.gz && \
    tar xf teleport-v1.0.5-linux-amd64-bin.tar.gz
RUN cd /tmp/teleport && make install
RUN rm -rf /tmp/teleport
COPY config/teleport.yml /etc/teleport.yml
COPY start.sh /start.sh
RUN apk del --no-cache wget make
RUN apk upgrade --no-cache

VOLUME ["/var/lib/teleport"]

EXPOSE 3022 3023 3024 3025 3080
CMD ["/start.sh"]

ENV NODENAME='dockertest' \
    AUTH_TOKEN='' \
    ADVERTIZE_IP='10.1.0.5' \
    SSL_KEY='/etc/teleport/teleport.key' \
    SSL_CRT='/etc/teleport/teleport.crt' \
    DEFAULT_USER='admin'