#A simple dockerfile for a application that caounts no. of requests - written in GO
FROM golang:latest

LABEL maintainer="vishnuvizz@protonmail.com"

#current wirking directory inside container
WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

#bulding application
RUN make build

#env variables
ENV DEMO_APP_ADDR=go-docker:8080
ENV DEMO_REDIS_ADDR=redis:6379

#running application with non root user for security 
RUN adduser  demouser
USER demouser

#run application when starting container 
CMD ["./demo.bin"]
