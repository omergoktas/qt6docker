# qt6docker

Dockerfile to build **Qt 6**

You can pull a prebuilt docker image from [Docker Hub](https://hub.docker.com/r/omergoktas/qt6docker) (_qtbase_ **only**):


```bash
sudo docker pull omergoktas/qt6docker:qtbase
```

> Based on the [code](https://github.com/wiktorguz/Qt6-docker) (_thanks to [@wiktorguz](https://github.com/wiktorguz)_)

## How to build an image

1. Clone the repository:

    ```bash
    git clone https://github.com/omergoktas/qt6docker
    cd qt6docker
    ```

2. Build the image:

    ```bash
    sudo docker build --tag qt6docker .
    ```

- **or** build the image with a specific Qt module (i.e., qtbase):

    ```bash
    sudo docker build --build-arg QT_MODULE=qtbase --tag qt6docker .
    ```

- **or** build the image with a specific version of Qt:

    ```bash
    sudo docker build --build-arg QT_MAJ=6.1 --build-arg QT_MIN=1 --tag qt6docker .
    ```

- **or** build the image with a specific version of Ubuntu:

    ```bash
    sudo docker build --build-arg BASE_IMAGE=ubuntu:18.04 --tag qt6docker .
    ```

- **or** build the image with a beta version of Qt:

    ```bash
    sudo docker build --build-arg QT_SRC_URL="https://download.qt.io/development_releases/qt/6.5/6.5.0-beta2/submodules/qtbase-everywhere-src-6.5.0-beta2.tar.xz" --tag qt6docker .
    ```

> **Note** Qt 6.1.2+ requires Ubuntu 20.04+ to build successfully.
