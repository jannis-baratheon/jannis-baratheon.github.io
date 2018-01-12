#!/bin/sh

# Based on this SO post: https://stackoverflow.com/a/33178233/4494577

SOURCE_BRANCH=develop
SOURCE_DIRECTORY=dist
TARGET_BRANCH=master

echo Deploying "${SOURCE_DIRECTORY}" directory from the "${SOURCE_BRANCH}" to the "${TARGET_BRANCH}" branch...
git push origin `git subtree split --prefix "${SOURCE_DIRECTORY}" "${SOURCE_BRANCH}"`:"${TARGET_BRANCH}" --force
echo Done.