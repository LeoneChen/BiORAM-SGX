#!/bin/bash
set -e

for ARG in "$@"
do
   KEY="$(echo $ARG | cut -f1 -d=)"
   VAL="$(echo $ARG | cut -f2 -d=)"
   export "$KEY"="$VAL"
done

SGXSDK_DIR=$(realpath ../../install)

DEBUG_FLAG=
CONF_FLAGS=
MODE=${MODE:="RELEASE"}
SIM=${SIM:="TRUE"}

echo "-- MODE: ${MODE}"
echo "-- SIM: ${SIM}"

if [[ "${MODE}" = "DEBUG" ]]
then
    DEBUG_FLAG=" -O0 -g"
else
    DEBUG_FLAG=" -O2"
fi

if [[ "${SIM}" = "TRUE" ]]
then
    CONF_FLAGS+=" --enable-sgx-simulation"
fi

mkdir -p build
cd build

../configure --with-sgxsdk=${SGXSDK_DIR} ${CONF_FLAGS} CFLAGS="${DEBUG_FLAG}" CXXFLAGS="${DEBUG_FLAG}" CC=clang-13 CXX=clang++-13

make -j1
