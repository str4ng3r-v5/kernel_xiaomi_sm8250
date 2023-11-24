#!/bin/bash

curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -

DEFCONFIG="/vendor/munch_defconfig"

export ARCH=arm64
export SUBARCH=arm64

export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-

export KBUILD_BUILD_USER="v3kt0r"
export KBUILD_BUILD_HOST="v3kt0rPC"

# Add Correct Path for your Compiler below
PATH="/home/user/clang/bin:$PATH"

make O=out clean mrproper
make O=out CC=clang ARCH=arm64 $DEFCONFIG

make O=out CC=clang -j$(nproc --all) \
    CFLAGS="-O2 -march=armv8-a -mcpu=kryo585 -flto=full -mllvm -polly -funroll-loops" \
    LDFLAGS="-O2 -flto=full -mllvm -polly -inline-threshold=100"

