# build
```bash
docker build -t izumix/bkp-ci .
```

# test 
```bash
docker run -it --rm \
-v ~/go/src/github.com/izumix03:/go/src/github.com/izumix03 \
-v ~/.ssh:/home/circleci/.ssh \
izumix/bkp-ci \
bash
```