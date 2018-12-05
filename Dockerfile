FROM circleci/golang:1.11
RUN go get github.com/golang/dep/cmd/dep \
   && go get github.com/alecthomas/gometalinter \
   && go get google.golang.org/grpc \
   && go get github.com/golang/protobuf/protoc-gen-go \
   && go get github.com/grpc-ecosystem/go-grpc-middleware/validator \
   && go get github.com/mwitkow/go-proto-validators \
   && go get github.com/mwitkow/go-proto-validators/protoc-gen-govalidators \
   && go get github.com/rubenv/sql-migrate/...

RUN sudo apt-get update
RUN gometalinter --install \
   && curl -OL https://github.com/google/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip \
   && unzip protoc-3.6.1-linux-x86_64.zip -d protoc3\
   && sudo mv protoc3/bin/* /usr/local/bin/\
   && sudo mv protoc3/include/* /usr/local/include/\
   && sudo chown circleci /usr/local/bin/protoc

RUN sudo apt-get -y install mysql-client \
   && sudo apt-get install ruby-full \
   && sudo gem install bundler
