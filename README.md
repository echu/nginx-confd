# nginx-confd
Dockerfile and resources for running nginx reverse proxy with confd services.

## Prerequisites
You must have etcd running?

## Installation
```
docker build -t nginx-confd .
```

## Example
Once the image is built, you can run it with
```
docker run -e ETCD_PORT=... -e HOST_IP=... -e confdKey=... nginx-confd
```
The port and IP default to `172.17.42.1:4001` and the confdKey defaults to
`/service`.

# Giants' shoulders
This repository drew from [this blog post](https://www.digitalocean.com/community/tutorials/how-to-use-confd-and-etcd-to-dynamically-reconfigure-services-in-coreos) and also uses [this script](https://github.com/marceldegraaf/blog-coreos-1/blob/master/nginx/boot.sh).
