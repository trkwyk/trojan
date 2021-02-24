FROM alpine:3.11 AS build
WORKDIR /build_trojan
COPY . .
RUN apk update \
    &&  apk add --no-cache --virtual .build-deps \
    build-base cmake boost-dev openssl-dev mariadb-connector-c-dev \
    && (cmake . && make -j $(nproc) && strip -s trojan)

FROM alpine:3.11
WORKDIR /config
COPY --from=build /build_trojan/trojan /usr/local/bin/trojan
RUN apk update \
    &&  apk add --no-cache --virtual .run-deps \
    libstdc++ boost-system boost-program_options mariadb-connector-c \
    &&  apk add --no-cache privoxy jq
COPY entry.sh examples/client.json-example ./
COPY privoxy.config /etc/privoxy/config/
EXPOSE 1088/tcp 1089/tcp
CMD ["sh", "entry.sh"]