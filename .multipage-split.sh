#!/bin/bash
set -ev
rm -rf out
mkdir out

git clone --depth=1 --branch=master https://github.com/adrianba/html-tools.git ./tools
pushd ./tools
npm install
popd

node ./tools/test.js

DIR=`pwd`
node ./tools/multipage.js file://$DIR/sample.html ./out/
