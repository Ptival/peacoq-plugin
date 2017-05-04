#!/usr/bin/env bash
set -euv

branch="trunk"
commit="0d1438851ba3a0b9f76847abc42f3bf8ad26c4cb" # V8.6

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
