# Dockerfile for creating a Docker image based on Oracle Linux

## Docker version

```bash
Client: Docker Engine - Community
 Version:           19.03.5
 API version:       1.40
 Go version:        go1.12.12
 Git commit:        633a0ea
 Built:             Wed Nov 13 07:22:37 2019
 OS/Arch:           windows/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.5
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.12
  Git commit:       633a0ea
  Built:            Wed Nov 13 07:29:19 2019
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v1.2.10
  GitCommit:        b34a5c8af56e510852c35414db4c1f4fa6172339
 runc:
  Version:          1.0.0-rc8+dev
  GitCommit:        3e425f80a8c931f88e6d94a8c831b9d5aa481657
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

## Dockerfile

### Creating the project folder

```bash
mkdir docker
```

### Creating the dockerfile

```bash
cd docker
touch Dockerfile
```

### Editing the Dockerfile

```bash
nano Dockerfile
```

Dockerfile content:

```bash
FROM oraclelinux

MAINTAINER Abdellatif ELAROUSSI <elaroussi@outlook.com>

RUN yum install -y httpd perl wget unzip && yum clean all

RUN wget https://github.com/igameproject/Breakout/archive/master.zip

RUN unzip /master.zip && rm /master.zip

RUN cp -a /Breakout-master/. /var/www/html && rm -rf Breakout-master

EXPOSE 80

CMD /usr/sbin/httpd -D FOREGROUND
```

## Create the Docker Image with the Dockerfile

```bash
docker build -t oracle-linux .
```

## Run the image

```bash
docker run --rm -d -p 80:80/tcp --name client1 oracle-linux:latest
```

### Limiting Runtime Resources

```bash
docker run --rm -d -p 80:80/tcp --memory=256m --cpu-shares=512 --name client1 oracle-linux:latest
```

## Opening the deployed web app in a browser

![capture](captures\Capture.PNG)

## Save the image

```bash
docker save -o oracle_linux.tar.gz oracle-linux
```

## Load the image

```bash
docker load -i oracle_linux.tar.gz
```

## A big image!

We produce a huge image with more than 470 MB, but no worries, we can always work with a more smaller image with the same functionalities using alpine.

## Push to Docker Hub

```bash
docker tag oracle-linux elaroussi/oracle-linux:v1
docker push elaroussi/oracle-linux
```
