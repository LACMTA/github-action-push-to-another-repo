#!/bin/sh -l

echo "Starting"

echo "cleaning tmp folders"

GITHUB_USERNAME="$1"
USER_EMAIL="$3"

rm -rf mybus


echo "Cloning destination git repository"
# Setup git
git config --unset-all http.https://github.com/.extraheader

git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone --single-branch --branch dev "https://$METRO_GITHUB_TOKEN@github.com/LACMTA/mybus.git" "mybus"

git remote add mybus-dev "https://$METRO_GITHUB_TOKEN@github.com/LACMTA/mybus-dev.git"
git push mybus-dev dev


echo "Done"


