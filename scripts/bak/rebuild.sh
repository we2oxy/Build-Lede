#!/bin/bash
echo "Rebuild":$(date +%F_%H%M%S)
cd /build/lede/
make clean
git pull
./scripts/feeds update -a &>/dev/null
./scripts/feeds install -a &>/dev/null
ls -lh /build/upload/*.buildinfo
cp -f /build/upload/*.buildinfo /build/lede/.config
ls -lh /build/lede/.config
cat /build/lede/.config
make -j1 V=s