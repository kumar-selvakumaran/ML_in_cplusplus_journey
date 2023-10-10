FROM ubuntu:18.04

RUN apt-get update 
ENV DEBIAN_FRONTEND=noninteractive

RUN apt install -y build-essential\
    unzip\
    git\ 
    cmake\
    cmake-curses-gui\    
    python3.8\
    python3-pip\
    libblas-dev\
    libopenblas-dev\
    libatlas-base-dev\
    liblapack-dev\
    libboost-all-dev\
    libopencv-core3.2\
    libopencv-imgproc3.2\
    libopencv-dev\
    libopencv-highgui3.2\
    libopencv-highgui-dev\
    protobuf-compiler\
    libprotobuf-dev\
    libhdf5-dev\
    libjson-c-dev\
    libx11-dev\
    openjdk-8-jdk\
    wget\
    ninja-build