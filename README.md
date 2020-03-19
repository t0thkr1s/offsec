![Docker Image CI](https://github.com/t0thkr1s/docker/workflows/Docker%20Image%20CI/badge.svg?branch=master)

The Dockerfile is based on the `ubuntu:rolling` image.

## Build The Image

```
docker build -t offsec .
```

## Start The Container
The current working directory will be shared and mapped to the `/root/shared` directory.

```
docker run --hostname offsec --rm -v $PWD:/root/shared --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name offsec -i offsec
```

## Spawn a Shell

```
docker exec -it offsec /bin/bash
```
