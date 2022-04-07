#!/usr/bin/env bash

DIR=./protobuf-3.20.0

if [ ! -d "$DIR" ] || [ ! "$(ls -A $DIR)" ]; then
  echo 'install protobuf from scratch'
  curl -O -L https://github.com/protocolbuffers/protobuf/releases/download/v3.20.0/protobuf-cpp-3.20.0.tar.gz
  tar -xzvf protobuf-cpp-3.20.0.tar.gz
  pushd protobuf-3.20.0 || exit
  ./autogen.sh
  ./configure --disable-shared && make && sudo make install
  popd || exit
else
  echo 'install protobuf from cache'
  pushd protobuf-3.20.0 || exit
  sudo make install
  popd || exit
fi