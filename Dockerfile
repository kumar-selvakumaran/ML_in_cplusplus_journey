FROM ubuntu:18.04

RUN apt update

RUN apt install build-essential -y
RUN apt install unzip -y
RUN apt install git -y 
RUN apt install cmake -y
RUN apt install cmake-curses-gui -y    
RUN apt install python3.8 -y
RUN apt install python3-pip -y
RUN apt install libblas-dev -y
RUN apt libopenblas-dev -y

