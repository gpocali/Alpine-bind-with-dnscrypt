FROM alpine:latest

RUN apk add bind

RUN mkdir /data

RUN mkdir /etc/templates

COPY ./named.conf.recursive /etc/templates/named.conf.recursive
COPY ./named.conf.config /etc/templates/named.conf.config

COPY ./exampleZone.internal /etc/templates/exampleZone.internal
COPY ./exampleZone.168.192.in-addr.arpa /etc/templates/exampleZone.168.192.in-addr.arpa

COPY ./dnscrypt-proxy.toml /etc/templates/dnscrypt-proxy.toml

COPY ./bind-with-dnscrypt-entry /bin/bind-with-dnscrypt-entry

RUN chmod +x /bin/bind-with-dnscrypt-entry

ENTRYPOINT ["/bin/bind-with-dnscrypt-entry"]
