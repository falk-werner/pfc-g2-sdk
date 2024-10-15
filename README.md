# PFC G2 SDK

## PREREQUISITES

### 1.) Download and install GIT
Make sure that you install GIT version >= 1.8.2

    sudo apt install git

### 2.) Install git-lfs (large file support)
Due to the fact that the repository contains files over 50MB you need the **GIT large file support** extension for GIT before you clone the repository.

    sudo apt install git-lfs && git lfs install

### 3.) Install docker 
Make sure that docker and make are installed on the host system.  
To install docker, please refer to the instructions depending on your host system, e.g for Ubuntu use [https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/).

Make sure docker can be run without root privileged. Refer to [https://docs.docker.com/engine/install/linux-postinstall/](https://docs.docker.com/engine/install/linux-postinstall/) for further information.

## Clone this repository

    git clone --recurse-submodules git@github.com:falk-werner/pfc-g2-sdk.git

## Build firmware

    docker buildx bake

Find the generated firmware images ans *.ipk files in the `out` directory.
