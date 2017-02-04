#!/usr/bin/env bash
set -euv

branch="v8.6"
commit="e7bb95f2ac0d151cfdccea7b769413b332489cd3"

if [ ! -d coq/.git ]; then
  git clone https://github.com/coq/coq.git
fi
cd coq
git fetch origin $branch
git checkout $commit
if [ ! -f config/Makefile ]; then
  ./configure -local
fi
make -j$(nproc) || make clean && make -j$(nproc)
make install
