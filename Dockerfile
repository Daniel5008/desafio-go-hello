FROM golang:1.21 AS builder

WORKDIR /app

COPY main.go .

RUN go mod init app && \
    go build -o main

FROM scratch

COPY --from=builder /app/main /main

ENTRYPOINT [ "/main" ]
