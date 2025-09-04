#!/bin/bash
set -e
git checkout --orphan temp_branch
git add -A
git commit -m "+primeiro-commit"
git branch -M main
git push -f codeberg main
git push -f github main
git push -f gitlab main