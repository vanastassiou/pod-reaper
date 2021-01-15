FROM golang:1.15.6-alpine

RUN apk --no-cache add curl git && curl https://glide.sh/get | sh && apk del curl

WORKDIR /go/src/app
COPY ["go.mod", "go.sum", "main.go", "/go/src/app/"]

RUN go build -o /pod-reaper

CMD  /pod-reaper
