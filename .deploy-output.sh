#!/bin/bash
set -ev
rm -rf out
mkdir out
STATUS=`git log -1 --pretty=oneline`
cd out
git init
git config user.name "Travis-CI"
git config user.email "noreply@example.com"
cp ../sample.html .
git add .
git commit -m "Built by Travis-CI: $STATUS"
git status

GH_REPO="@github.com/adrianba/sample-spec-draft.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git push --force --quiet $FULL_REPO master:gh-pages > /dev/null 2>&1