ARG BASE_IMAGE=ubuntu:20.04
FROM $BASE_IMAGE as base
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        python3-pip \
        build-essential \
        libgl1-mesa-dev \
        libfontconfig1-dev \
        libfreetype6-dev \
        libx11-dev \
        libx11-xcb-dev \
        libxext-dev \
        libxfixes-dev \
        libxi-dev \
        libxrender-dev \
        libxcb1-dev \
        libxcb-glx0-dev \
        libxcb-keysyms1-dev \
        libxcb-image0-dev \
        libxcb-shm0-dev \
        libxcb-icccm4-dev \
        libxcb-sync-dev \
        libxcb-xfixes0-dev \
        libxcb-shape0-dev \
        libxcb-randr0-dev \
        libxcb-render-util0-dev \
        libxcb-util-dev \
        libxcb-xinerama0-dev \
        libxcb-xkb-dev \
        libxkbcommon-dev \
        libxkbcommon-x11-dev \
        git \
        wget && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install --upgrade pip
RUN pip3 install cmake ninja

FROM base as builder

# Download Qt source codes
ARG QT_SRC_URL
ARG QT_MODULE
ARG QT_MAJ=6.1
ARG QT_MIN=3
ARG QT_VER=${QT_MAJ}.${QT_MIN}
RUN if [ -n "$QT_SRC_URL" ]; then { \
        wget -O qtworkspace.tar.xz "$QT_SRC_URL"; \
    }; elif [ -n "$QT_MODULE" ]; then { \
        wget -O qtworkspace.tar.xz https://download.qt.io/archive/qt/${QT_MAJ}/${QT_VER}/submodules/${QT_MODULE}-everywhere-src-${QT_VER}.tar.xz; \
    }; else { \
        wget -O qtworkspace.tar.xz https://download.qt.io/archive/qt/${QT_MAJ}/${QT_VER}/single/qt-everywhere-src-${QT_VER}.tar.xz; \
    }; fi; \
    mkdir qtworkspace; \
    tar -xf qtworkspace.tar.xz -C qtworkspace --strip-components 1;

# Build Qt
WORKDIR qtworkspace
RUN mkdir build
RUN cmake -S . -B build -G Ninja
RUN cmake --build build --parallel
RUN cmake --install build --prefix /usr/local/qt6

# Finalize installation
FROM base
WORKDIR /home/qt6
COPY --from=builder /usr/local/qt6 /usr/local/qt6
ENV PATH="$PATH:/usr/local/qt6/bin"
