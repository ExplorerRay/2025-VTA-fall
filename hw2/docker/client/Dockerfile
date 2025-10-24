FROM gcc:12.2.0 AS builder

COPY socket_client.c /src/socket_client.c

WORKDIR /src

RUN gcc -o client socket_client.c

FROM debian:stable-slim

COPY --from=builder /src/client /src/client

EXPOSE 8888

ENTRYPOINT [ "/src/client" ]

CMD []
