# GO-GRPC 

Explore posibilities of gRPC


## Prerequisites

1. Install protub

```bash

 go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
 go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

2. Update PATH

```bash
export PATH="$PATH:$(go env GOPATH)/bin"
```

3.  Generate gRPC Code

```sh

protoc --go_out=. protoc --go_out=./generated --go_opt=paths=source_relative \      
  --go-grpc_out=./generated --go-grpc_opt=paths=source_relative \ 
    order/order.proto


``` 

