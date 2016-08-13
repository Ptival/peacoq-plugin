#!/usr/bin/env bash
set -euv

case "$1" in
export)
  echo PATH=$TRAVIS_BUILD_DIR/coq/bin:$TRAVIS_BUILD_DIR/opam:$PATH
  ;;
before_install)
  mkdir -p opam
  wget "https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh" -O - | sh -s $TRAVIS_BUILD_DIR/opam
  ;;
esac
