FROM alpine:edge@sha256:13e33149491ce3a81a82207e8f43cd9b51bf1b8998927e57b1c2b53947961522

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update --no-cache \
    curl \
    iputils \
    python \
    shellinabox

COPY docker-entrypoint.sh /usr/bin
COPY dark.css /etc/shellinabox/dark.css

RUN addgroup -g 1001 deadman \
     && adduser -D -G deadman -u 1001 deadman

ENV DEADMAN_VERSION=0484690be07cda63281be23baa3be2b9bffc8c9a
ENV DEADMAN_CHECKSUM=b308eb5774396574b8f65a39c4093510646a1ccf9526b1c50db0c242b045b89f

RUN cd /home/deadman \
    && curl -fSsL "https://github.com/upa/deadman/archive/${DEADMAN_VERSION}.zip" \
            -o deadman.zip \
    && unzip "deadman.zip" \
    && rm -f "deadman.zip" \
    && mv "deadman-${DEADMAN_VERSION}" "deadman"

CMD ["/usr/bin/docker-entrypoint.sh"]

EXPOSE 4200
VOLUME /config
