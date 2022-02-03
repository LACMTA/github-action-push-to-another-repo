#!/bin/sh -l

echo "Starting"

echo "cleaning tmp folders"

rm -rf mybus


echo "Cloning source repository"
# Setup git
git clone --single-branch --branch dev "https://$API_TOKEN_GITHUB@github.com/LACMTA/mybus.git" "mybus"

echo $DESTINATION_GITHUB_USERNAME
echo $DESTINATION_GITHUB_EMAIL

echo "Adding destination repository as remote"
git remote add mybus-dev "https://$API_TOKEN_GITHUB@github.com/LACMTA/mybus-dev.git"

echo "Pushing to destination repository"
git push mybus-dev dev


echo "Done"


