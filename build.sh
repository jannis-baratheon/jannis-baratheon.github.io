#!/bin/sh

# clean
rm -rf out
rm -rf target

# build resume
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO out/resume.html -t node_modules/jsonresume-theme-flat-custom
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO out/resume.pdf -t node_modules/jsonresume-theme-flat
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO out/resume.txt
node_modules/hackmyresume/dist/cli/index.js BUILD src/resume.json TO out/resume.md

# create target directory structure
mkdir -p target/resumes
mkdir -p target/css
mkdir -p target/js
mkdir -p target/vendor/css
mkdir -p target/vendor/js
mkdir -p target/vendor/fonts

cp src/CNAME target
cp src/index.html target
cp src/style.css target/css
cp src/script.js target/js
cp out/resume.html out/resume.pdf out/resume.txt out/resume.md target/resumes
./node_modules/bestzip/bin/cli.js target/resumes/resume.zip target/resumes/resume.*

# css
cp node_modules/bootstrap/dist/css/bootstrap.min.css target/vendor/css

# js
cp node_modules/bootstrap/dist/js/bootstrap.min.js target/vendor/js
cp node_modules/jquery/dist/jquery.slim.min.js target/vendor/js
cp node_modules/popper.js/dist/umd/popper.min.js target/vendor/js

# fonts
mkdir -p target/vendor/fonts/font-awesome
cp -r node_modules/font-awesome/css node_modules/font-awesome/fonts target/vendor/fonts/font-awesome
mkdir -p target/vendor/fonts/devicons
cp -r node_modules/devicons/css node_modules/devicons/fonts target/vendor/fonts/devicons
