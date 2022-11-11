# qt6bionic

Dockerfile for Ubuntu 18.04 Bionic with Qt 6.1.3

See prebuilt qtbase image on [docker hub](https://hub.docker.com/r/omergoktas/qt6bionic)

Based on [this](https://github.com/wiktorguz/Qt6-docker)

## How to build an image

1. For starters, download the source code:

        git clone https://github.com/omergoktas/qt6bionic
        cd qt6bionic

2. Build the image:

        sudo docker build --tag qt6bionic .

- Or build the image with a specific Qt module (i.e., qtbase):

        sudo docker build --build-arg QT_MODULE=qtbase --tag qt6bionic .

- Or build the image with a specific Qt version:

        sudo docker build --build-arg QT_MAJ=6.1 --build-arg QT_MIN=1 --tag qt6bionic .

> You may need to modify the Dockerfile and **base** your build on a higher version of Ubuntu (i.e., 20.04) in order to build newer versions of the Qt successfully (due to older versions of GCC being shipped on 18.04).
