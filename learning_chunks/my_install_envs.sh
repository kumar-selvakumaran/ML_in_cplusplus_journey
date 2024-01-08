#!/usr/bin/env bash
set -x
set -e

DEV_DIR=$(pwd)

if [ ! -d "./libs/sources" ]
then
    mkdir libs
    mkdir libs/sources
fi

# Shogun
. ./install_lib.sh https://github.com/shogun-toolbox/shogun f7255cf2cc6b5116e50840816d70d21e7cc039bb master -DBUILD_META_EXAMPLES=OFF -DHAVE_HDF5=ON -DHAVE_PROTOBUF=OFF

# SharkML
. ./install_lib.sh https://github.com/Shark-ML/Shark 221c1f2e8abfffadbf3c5ef7cf324bc6dc9b4315 master

# DLib
. ./install_lib.sh https://github.com/davisking/dlib 929c630b381d444bbf5d7aa622e3decc7785ddb2 v19.15

# Armadillo
. ./install_lib.sh https://gitlab.com/conradsnicta/armadillo-code 442d52ba052115b32035a6e7dc6587bb6a462dec 9.900.x

# xtl
. ./install_lib.sh https://github.com/xtensor-stack/xtl 03a6827c9e402736506f3ded754e890b3ea28a98 master

# xtensor
. ./install_lib.sh https://github.com/xtensor-stack/xtensor 02d8039a58828db1ffdd2c60fb9b378131c295a2 master

# xtensor-blas
. ./install_lib.sh https://github.com/xtensor-stack/xtensor-blas 89d9df93ff7306c32997e8bb8b1ff02534d7df2e master

# RapidJson
. ./install_lib.sh https://github.com/Tencent/rapidjson 73063f5002612c6bf64fe24f851cd5cc0d83eef9 master

# mlpack
. ./install_lib.sh https://github.com/mlpack/mlpack e2f696cfd5b7ccda2d3af1c7c728483ea6591718 master -DBUILD_PYTHON_BINDINGS=OFF -DBUILD_TESTS=OFF -DDOWNLOAD_ENSMALLEN=ON

# Eigen
. ./install_lib.sh https://github.com/eigenteam/eigen-git-mirror cf794d3b741a6278df169e58461f8529f43bce5d 3.3.7 

# PyTorch
. ./install_lib.sh https://github.com/pytorch/pytorch 8554416a199c4cec01c60c7015d8301d2bb39b64 v1.2.0 -DBUILD_PYTHON=OFF -DONNX_NAMESPACE=onnx_torch

# ONNX
. ./install_lib.sh https://github.com/onnx/onnx.git 28ca699b69b5a31892619defca2391044a9a6052 -DONNX_NAMESPACE=onnx_torch

# HighFive
. ./install_lib.sh https://github.com/BlueBrain/HighFive 41b0390d6102184b1b6617cefb3fe89ef9cbe07d

# cpp-httplib
. ./install_lib.sh https://github.com/yhirose/cpp-httplib 2c6da365d98c640b9cff4b3a7eb213673ba25910

# PlotCpp
. ./checkout_lib.sh https://github.com/Kolkir/plotcpp c86bd4f5d9029986f0d5f368450d79f0dd32c7e4

# fast-cpp-csv-parser
. ./checkout_lib.sh https://github.com/ben-strasser/fast-cpp-csv-parser 3b439a664090681931c6ace78dcedac6d3a3907e master



# return back
cd $DEV_DIR


