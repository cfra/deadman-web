FROM alpine:3.13@sha256:ccf92aa53bc6c3b25be2ad0cce80baec1778f007f7e076b0ffbd1b225d0b3a9b

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update --no-cache \
    curl \
    iputils \
    python3 \
    shellinabox

COPY docker-entrypoint.sh /usr/bin
COPY dark.css /etc/shellinabox/dark.css

RUN addgroup -g 1001 deadman \
     && adduser -D -G deadman -u 1001 deadman

ENV DEADMAN_VERSION=662dbe60021978b85932c4e95864e9e8827804b9
ENV DEADMAN_CHECKSUM=ef19b5753f5867bfc4fa09d5be7702603bb6b45ab659ca2803e2f758001ade12

RUN cd /home/deadman \
    && curl -fSsL "https://github.com/upa/deadman/archive/${DEADMAN_VERSION}.zip" \
            -o deadman.zip \
    && echo "${DEADMAN_CHECKSUM}  deadman.zip" | sha256sum -c - \
    && unzip "deadman.zip" \
    && rm -f "deadman.zip" \
    && mv "deadman-${DEADMAN_VERSION}" "deadman"

CMD ["/usr/bin/docker-entrypoint.sh"]

EXPOSE 4200
VOLUME /config
