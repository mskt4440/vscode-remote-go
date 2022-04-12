FROM golang:1.18.0-alpine3.14 as builder
WORKDIR /go/src/
COPY go.mod go.sum ./
RUN go mod download
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest as distribution
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/app ./
ENTRYPOINT ["./app"]