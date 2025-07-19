# What is this?

This is a container for a blank system to be run. This often helps to know exhaustively the dependencies needed to install something.

It supports some minimal things, like having a mounting space to read and write data to. 

# To instantly run

Start a container and shell:
```sh
TAG="ubuntu_25.04" MOUNT="." sh <(curl -sSf https://raw.githubusercontent.com/delta-domain-rnd/delta-box/refs/heads/main/box/box000_blank_system/docker_sh.sh)
```

Stop the container when done:

```sh
sh <(curl -sSf https://raw.githubusercontent.com/delta-domain-rnd/delta-box/refs/heads/main/box/box000_blank_system/docker_stop.sh)
```

# Build

```sh
IMAGE="ubuntu:25.04" TAG="ubuntu_25.04" ./docker_build.sh
IMAGE="alpine:latest" TAG="alpine_latest" ./docker_build.sh
```

# Run a shell

```sh
TAG="ubuntu_25.04" ./docker_sh.sh
```

# Stop the container with the shell

```sh
./docker_stop.sh
```

# Publishing

```sh
docker login -u lan22h
TAG="ubuntu_25.04" ./docker_publish.sh
```

The images can be found in [lan22h @ DockerHub](https://hub.docker.com/repositories/lan22h)

# Development Context

The development journal for this can be found [here](https://github.com/LanHikari22/lan-setup-notes/blob/main/lan/topics/tooling/linux/tasks/2025/002%20Creating%20base%20system%20for%20installation%20testing.md).
