FROM alpine:latest

RUN apk add bind dnscrypt-proxy inotify-tools

RUN mkdir /data

RUN mkdir /etc/templates

COPY ./named.conf.recursive /etc/templates/named.conf.recursive
COPY ./named.conf.logging /etc/templates/named.conf.logging

COPY ./dnscrypt-proxy.toml /etc/templates/dnscrypt-proxy.toml

COPY ./bind-with-dnscrypt-entry /bin/bind-with-dnscrypt-entry

RUN chmod +x /bin/bind-with-dnscrypt-entry

EXPOSE 53/UDP
EXPOSE 53/TCP

VOLUME /data

ENTRYPOINT ["/bin/bind-with-dnscrypt-entry"]
