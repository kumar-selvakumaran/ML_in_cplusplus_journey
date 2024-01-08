#!/usr/bin/env bash
set -x
set -e
# set -v

START_DIR=$(pwd)
REPOSITORY=$1
COMMIT_HASH=$2
BRANCH=$3
shift; shift;
EXTRA_CMAKE_PARAMS=$@

cd $START_DIR/libs/sources

echo -e "\n\nstart_dir : $START_DIR \nrepository : $REPOSITORY \nbranch: $BRANCH \ncommit hash : $COMMIT_HASH"

if [ -z "$BRANCH" ]
then
    echo -e "branch is empty : $BRANCH\\n\n"
else
    echo -e "branch is not empty : $BRANCH\n\n"
fi

REPO_NAME=$(echo $REPOSITORY | awk -F '/' '{print $NF}')

echo -e "\nrepo name : $REPO_NAME\n"

if [ ! -d "./$REPO_NAME" ]
then
    git clone -b $BRANCH $REPOSITORY
    cd "$(basename "$REPOSITORY" .git)"
    git checkout $COMMIT_HASH

    if [ -f ".gitmodules" ];then
    sed -i 's/git:\/\//https:\/\//g' ".gitmodules"
    fi

    git submodule update --init --recursive
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$START_DIR/libs $EXTRA_CMAKE_PARAMS ..
    cmake --build . --target install -- -j8
    cd ..
    rm -rf build
    cd $START_DIR
fi
