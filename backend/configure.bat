@echo off
pushd %cd%
mkdir build
cd build
cmake .. %*
popd