FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go mod download && go build -o main .

FROM scratch

COPY --from=builder /app/main /

ENTRYPOINT ["/main"]