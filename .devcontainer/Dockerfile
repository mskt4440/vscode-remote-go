FROM golang:1.18.0-alpine3.14 as development

ENV CGO_ENABLED 0
WORKDIR /go/app 

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk add --no-cache \
    git \
    curl
COPY go.mod go.sum ./
RUN go mod download

RUN go install github.com/go-delve/delve/cmd/dlv@latest && \
    go install github.com/ramya-rao-a/go-outline@latest && \
    go install github.com/cweill/gotests/gotests@latest && \
    go install github.com/fatih/gomodifytags@latest && \
    go install github.com/josharian/impl@latest && \
    go install github.com/haya14busa/goplay/cmd/goplay@latest && \
    go install honnef.co/go/tools/cmd/staticcheck@latest && \
    go install golang.org/x/tools/gopls@latest