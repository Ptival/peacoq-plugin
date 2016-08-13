#!/usr/bin/env bash
set -euv

case "$1" in
export)
  echo PATH=$TRAVIS_BUILD_DIR/coq/bin:$PATH
  ;;
before_install)
  brew update
  brew install ocaml camlp5 opam
  ;;
esac
