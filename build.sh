#!/bin/sh

INTERMEDIATE_DIRECTORY=intermediate
DIST_DIRECTORY=dist

yarn

# clean
rm -rf "${INTERMEDIATE_DIRECTORY}"
rm -rf "${DIST_DIRECTORY}"

# build resume
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO "${INTERMEDIATE_DIRECTORY}"/resume.html -t node_modules/jsonresume-theme-flat-custom
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO "${INTERMEDIATE_DIRECTORY}"/resume.pdf -t node_modules/jsonresume-theme-flat
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO "${INTERMEDIATE_DIRECTORY}"/resume.txt
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO "${INTERMEDIATE_DIRECTORY}"/resume.md

# create dist directory structure
mkdir -p "${DIST_DIRECTORY}"/resumes
mkdir -p "${DIST_DIRECTORY}"/css
mkdir -p "${DIST_DIRECTORY}"/js
mkdir -p "${DIST_DIRECTORY}"/vendor/css
mkdir -p "${DIST_DIRECTORY}"/vendor/js
mkdir -p "${DIST_DIRECTORY}"/vendor/fonts

cp src/CNAME "${DIST_DIRECTORY}"
cp src/index.html "${DIST_DIRECTORY}"
cp src/style.css "${DIST_DIRECTORY}"/css
cp src/script.js "${DIST_DIRECTORY}"/js
cp "${INTERMEDIATE_DIRECTORY}"/resume.html "${INTERMEDIATE_DIRECTORY}"/resume.pdf "${INTERMEDIATE_DIRECTORY}"/resume.txt "${INTERMEDIATE_DIRECTORY}"/resume.md "${DIST_DIRECTORY}"/resumes
./node_modules/bestzip/bin/cli.js "${DIST_DIRECTORY}"/resumes/resume.zip "${DIST_DIRECTORY}"/resumes/resume.*

# css
cp node_modules/bootstrap/dist/css/bootstrap.min.css "${DIST_DIRECTORY}"/vendor/css

# js
cp node_modules/bootstrap/dist/js/bootstrap.min.js "${DIST_DIRECTORY}"/vendor/js
cp node_modules/jquery/dist/jquery.slim.min.js "${DIST_DIRECTORY}"/vendor/js
cp node_modules/popper.js/dist/umd/popper.min.js "${DIST_DIRECTORY}"/vendor/js

# fonts
mkdir -p "${DIST_DIRECTORY}"/vendor/fonts/font-awesome
cp -r node_modules/font-awesome/css node_modules/font-awesome/fonts "${DIST_DIRECTORY}"/vendor/fonts/font-awesome
mkdir -p "${DIST_DIRECTORY}"/vendor/fonts/devicons
cp -r node_modules/devicons/css node_modules/devicons/fonts "${DIST_DIRECTORY}"/vendor/fonts/devicons
