#!/bin/sh

if [ -z "$1" ]
then
  echo "Which folder do you want to deploy to GitHub Pages (hosted on the master branch)?"
  exit 1
fi

git subtree push --prefix $1 origin test