#!/bin/bash
set -e

ROOT_DIR=$(realpath -s $(dirname $0))

if [[ $1 == 'debug' ]]; then
    DEBUG_FLAG=" -O0 -g"
else
    DEBUG_FLAG=" -O2"
fi

mkdir -p build
cd build

../configure CFLAGS="${DEBUG_FLAG}" CXXFLAGS="${DEBUG_FLAG}"

make -j$(nproc)

ln -s ../settings

# ~/SGXSan/Tool/GetLayout.sh -d ./build/Enclave/ Enclave_t.o Enclave.o MLfunc_SGX.o ObliviousRAM_SGX.o SGX_Sort.o SGX_Math.o /opt/intel/sgxsdk/lib64/libsgx_trts.a /opt/intel/sgxsdk/lib64/libsgx_tkey_exchange.a /opt/intel/sgxsdk/lib64/libsgx_tcxx.a /opt/intel/sgxsdk/lib64/libsgx_tstdc.a /opt/intel/sgxsdk/lib64/libsgx_tservice.a