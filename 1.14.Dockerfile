#https://github.com/golang/go/wiki/Modules
# docker build . -t kuritka/vendor-go1.14:v0.0.1
# docker run -it --rm kuritka/vendor-go1.14:v0.0.1
FROM amd64/golang:1.14
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...

#in GO 1.13 and lover you must explicitly put mod=vendor to build vendor folder. in GO 1.14 you ignore that because mod=vendor is added automatically
RUN go build .

ENTRYPOINT ["./awesomeProject1"]


# Returns Logger configured HELLO FROM VENDOR FOLDER all the time