# qt6bionic

Dockerfile to build **Ubuntu 18.04 Bionic** image with _ready-to-use_ **Qt 6**

Pull prebuilt docker image from [Docker Hub](https://hub.docker.com/r/omergoktas/qt6bionic) (_qtbase_ **only**):

```bash
sudo docker pull omergoktas/qt6bionic:qtbase
```

> Based on the [code](https://github.com/wiktorguz/Qt6-docker) (_thanks to [@wiktorguz](https://github.com/wiktorguz)_)

## How to build an image

1. For starters, download the source code:

    ```bash
    git clone https://github.com/omergoktas/qt6bionic
    cd qt6bionic
    ```

2. Build the image:

    ```bash
    sudo docker build --tag qt6bionic .
    ```

- **or** build the image with a specific Qt module (i.e., qtbase):

    ```bash
    sudo docker build --build-arg QT_MODULE=qtbase --tag qt6bionic .
    ```

- **or** build the image with a specific Qt version:

    ```bash
    sudo docker build --build-arg QT_MAJ=6.1 --build-arg QT_MIN=1 --tag qt6bionic .
    ```

> You may need to modify the Dockerfile and **base** your image on a newer version of Ubuntu (i.e., 20.04) in order to build newer versions of the Qt successfully (due to older versions of GCC being shipped on 18.04).
