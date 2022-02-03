#!/bin/sh -l

echo "Starting"

echo "cleaning tmp folders"

GITHUB_USERNAME="$1"
USER_EMAIL="$3"
GITHUB_TOKEN="$4"

rm -rf mybus


echo "Cloning destination git repository"
# Setup git
git clone --single-branch --branch dev "https://$GITHUB_TOKEN@github.com/LACMTA/mybus.git" "mybus"

git remote add mybus-dev "https://$GITHUB_TOKEN@github.com/LACMTA/mybus-dev.git"
git push mybus-dev dev


echo "Done"


