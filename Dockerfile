FROM ubuntu:18.04 as base

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
        python3-pip \
        build-essential \
        libgl1-mesa-dev \
        git \
        wget && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install cmake ninja

FROM base as builder

ARG QT_VER=6.1.3

RUN wget https://download.qt.io/archive/qt/6.1/${QT_VER}/single/qt-everywhere-src-${QT_VER}.tar.xz
RUN tar -xf qt-everywhere-src-${QT_VER}.tar.xz
WORKDIR qt-everywhere-src-${QT_VER}
RUN mkdir build
WORKDIR build
RUN cmake .. -GNinja
RUN cmake --build . --parallel
RUN cmake --install .

FROM base

WORKDIR /home/qt

COPY --from=builder /usr/local /usr/local

RUN wget https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage && chmod a+x linuxdeployqt-continuous-x86_64.AppImage
