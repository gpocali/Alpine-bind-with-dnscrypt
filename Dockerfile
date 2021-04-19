FROM alpine:latest

RUN apk add bind dnscrypt-proxy

RUN mkdir /data

RUN mkdir /etc/templates

COPY ./named.conf.recursive /etc/templates/named.conf.recursive

COPY ./dnscrypt-proxy.toml /etc/templates/dnscrypt-proxy.toml

COPY ./bind-with-dnscrypt-entry /bin/bind-with-dnscrypt-entry

RUN chmod +x /bin/bind-with-dnscrypt-entry

ENTRYPOINT ["/bin/bind-with-dnscrypt-entry"]
