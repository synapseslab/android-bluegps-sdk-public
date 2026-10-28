#!/bin/bash

# The website is built using MkDocs with the Material theme.
# https://squidfunk.github.io/mkdocs-material/
# It requires Python to run.
# Install the packages with the following command:
# pip install mkdocs mkdocs-material mkdocs-redirects

set -ex


# Build the site locally
cd ./android-docs
python3 -m venv venv
source venv/bin/activate
# Pinned: an unpinned install silently changes the theme and its config rules between builds.
# Material for MkDocs reaches end of life on 2027-05-05; Zensical is its successor.
pip3 install mkdocs-material==9.8.0
mkdocs build