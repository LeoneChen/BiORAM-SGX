#!/bin/bash
set -e

SGXSDK_DIR=$(realpath ../../install)

MODE=${MODE:="RELEASE"}

echo "-- MODE: ${MODE}"

if [[ "${MODE}" = "DEBUG" ]]
then
    DEBUG_FLAG=" -O0 -g"
else
    DEBUG_FLAG=" -O2"
fi

mkdir -p build
cd build

../configure --with-sgxsdk=${SGXSDK_DIR} --enable-sgx-simulation CFLAGS="${DEBUG_FLAG}" CXXFLAGS="${DEBUG_FLAG}" CC=clang-13 CXX=clang++-13

make
