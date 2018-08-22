#!/usr/bin/env bash
set -euv

branch="v8.8"

if [ ! -d coq/.git ]; then
  git clone https://github.com/coq/coq.git
fi
cd coq
git fetch origin $branch
git checkout $branch
if [ ! -f config/Makefile ]; then
  ./configure -local
fi
make -j$(nproc) || make clean && make -j$(nproc)
make install
