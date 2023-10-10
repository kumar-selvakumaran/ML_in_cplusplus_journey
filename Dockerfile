FROM ubuntu:18.04

RUN apt-get update 
ENV DEBIAN_FRONTEND=noninteractive

RUN apt install build-essential -y
RUN apt install unzip -y
RUN apt install git -y 
RUN apt install cmake -y
RUN apt install cmake-curses-gui -y    
RUN apt install python3.8 -y
RUN apt install python3-pip -y
RUN apt install libblas-dev -y
RUN apt install libopenblas-dev -y
RUN apt install libatlas-base-dev -y
RUN apt install liblapack-dev -y
RUN apt install libboost-all-dev -y
RUN apt install libopencv-core3.2 -y
RUN apt install libopencv-imgproc3.2 -y
RUN apt install libopencv-dev -y
RUN apt install libopencv-highgui3.2 -y
RUN apt install libopencv-highgui-dev -y
RUN apt install protobuf-compiler -y
RUN apt install libprotobuf-dev -y
RUN apt install libhdf5-dev -y
RUN apt install libjson-c-dev -y
RUN apt install libx11-dev -y
RUN apt install openjdk-8-jdk -y
RUN apt install wget -y
RUN apt install ninja-build -y
