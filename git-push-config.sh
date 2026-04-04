#!/bin/bash
set -e
git remote add origin https://codeberg.org/rauldipeas/.profile
git remote set-url --add --push origin https://codeberg.org/rauldipeas/.profile
git remote set-url --add --push origin https://github.com/rauldipeas/rauldipeas
git push --set-upstream origin main