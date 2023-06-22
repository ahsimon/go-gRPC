#!/bin/bash
SERVICE_NAME=$1
RELEASE_VERSION=$2
sudo apt-get install -y protobuf-compiler golang-goprotobuf-dev
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
protoc --go_out=. protoc --go_out=./generated --go_opt=paths=source_relative \      
  --go-grpc_out=./generated --go-grpc_opt=paths=source_relative \ 
    ${SERVICE_NAME}/order.proto \

cd golang/${SERVICE_NAME}
go mod init
github.com/ahsimon/go-gRPC/generated/${SERVICE_NAME} || true
go mod tidy
cd ../../

git add . && git commit -am "proto update" || true
git tag -fa golang/${SERVICE_NAME}/${RELEASE_VERSION} \
-m "golang/${SERVICE_NAME}/${RELEASE_VERSION}"
git push origin refs/tags/golang/${SERVICE_NAME}/${RELEASE_VERSION}