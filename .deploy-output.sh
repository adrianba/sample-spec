#!/bin/bash
set -ev
STATUS=`git log -1 --pretty=oneline`
cd out
git init
git config user.name "Travis-CI"
git config user.email "travis-ci"
cp ../sample.html .
ls
git add .
git commit -m "Built by Travis-CI: $STATUS"
git status

GH_REPO="@github.com/adrianba/sample-spec.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git push --force --quiet $FULL_REPO master:gh-pages > /dev/null 2>&1
