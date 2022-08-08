# Docker installation
For Windows, you can install the [Docker Desktop GUI](https://docs.docker.com/desktop/install/windows-install/).

For Ubuntu, you can install the [Docker Engine CLI](https://docs.docker.com/engine/install/ubuntu/). Follow the full steps, which are replicated below:

## Set up the repository
Update the apt package index and install packages to allow apt to use a repository over HTTPS:

    sudo apt-get update
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
## Add Docker’s official GPG key:

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
## Use the following command to set up the repository:

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
## Install Docker Engine
Update the apt package index, and install the latest version of Docker Engine, containerd, and Docker Compose, or go to the next step to install a specific version:

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

This guide is mirrored from the official Docker documentation.

## .dockerignore
It is useful to specify files that are not needed such as testing folders to slim the size of the Docker container.