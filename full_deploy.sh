#!/bin/bash

VERSION=$1

if [ ! -z "$(git status --porcelain)" ]
then
	echo Working directory needs to be clean to perform this operation.
	exit 1
fi

if [ -z "${VERSION}" ]
then
	echo Expected version as the first parameter.
	exit 1
fi

echo Building...
./build.sh

if [ -z "$(git status --porcelain)" ]
then
	echo No changes to deploy. Aborting.
	exit 1
fi

echo Pushing dist and tags...
git add -A .
git commit -m "Deploying ${VERSION}"
git tag ${VERSION}
git push origin
git push --tags

echo Deploying...
./deploy.sh