FROM circleci/golang:1.11
RUN go get github.com/golang/dep/cmd/dep \
   && go get github.com/alecthomas/gometalinter \
   && go get google.golang.org/grpc \
   && go get github.com/stormcat24/protodep \
   && go get github.com/golang/protobuf/protoc-gen-go \
   && go get github.com/grpc-ecosystem/go-grpc-middleware/validator \
   && go get github.com/mwitkow/go-proto-validators \
   && go get github.com/mwitkow/go-proto-validators/protoc-gen-govalidators \
   && go get github.com/rubenv/sql-migrate/...

RUN sudo apt-get update
RUN gometalinter --install && curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip \
&& unzip protoc-3.2.0-linux-x86_64.zip -d protoc3\
&& sudo mv protoc3/bin/* /usr/local/bin/\
&& sudo mv protoc3/include/* /usr/local/include/\
&& sudo chown circleci /usr/local/bin/protoc\
&& sudo chown -R circleci /usr/local/include/google

RUN curl https://sdk.cloud.google.com | bash
RUN /bin/bash -c "source /home/circleci/google-cloud-sdk/completion.bash.inc"
RUN /bin/bash -c "source /home/circleci/google-cloud-sdk/path.bash.inc"
ENV PATH $PATH:/home/circleci/google-cloud-sdk/bin