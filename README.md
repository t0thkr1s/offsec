![Docker Image CI](https://github.com/t0thkr1s/docker/workflows/Docker%20Image%20CI/badge.svg?branch=master)

The Dockerfile is based on the [kali-rolling](https://registry.hub.docker.com/r/kalilinux/kali-rolling) image.
It's also important to mention that the final image size will be around 4GB because of the necessary packages, tools and wordlists.

## Build The Image

```
docker build -t offsec .
```

## Start The Container
The following command will expose port 8000, 9898 and 9797 to the host. The current working directory will be shared.

```
docker run -p 8000:8000 -p 9898:9898 -p 9797:9797 --hostname offsec --rm -v $PWD:/root/shared --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name offsec -i offsec
```

## Spawn a Shell

```
docker exec -it offsec /usr/bin/fish
```
