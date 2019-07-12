FROM alpine:3.10@sha256:6a92cd1fcdc8d8cdec60f33dda4db2cb1fcdcacf3410a8e05b3741f44a9b5998

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

ENV DEADMAN_VERSION=247db0692109e6b32ea5c304c2e871bc0741dc7f
ENV DEADMAN_CHECKSUM=41901e6b4e5ab4744eae6d1f1e2a409b062353b39aa6cd1bd13d7a193b98afcb

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
