#!/usr/bin/env bash

TARGET="aarch64-linux-musl"
OUTPUT="/opt/cross/"

cp config.mak.dist config.mak

echo "OUTPUT = $OUTPUT" >> config.mak
# Improve build time
echo "GCC_CONFIG += --enable-languages=c,c++" >> config.mak
# Fix for possible inconsistencies of CPU instructions set
echo "GCC_CONFIG += -march=x86_64" >> config.mak

# Compile TARGET and install
make
sudo make install

# Compress TARGET
sudo tar -cJf "$TARGET.tar.xz" -C "$OUTPUT" .
