FROM alpine:3.23.3

WORKDIR /app

RUN apk add --no-cache ca-certificates && \
    adduser -D -u 1001 orbisproxy

COPY dist/orbisproxy-linux /app/orbisproxy

RUN chmod +x /app/orbisproxy

RUN chown -R 1001:1001 /app

USER orbisproxy

WORKDIR /app/data

EXPOSE 5520/udp

ENTRYPOINT ["/app/orbisproxy"]
