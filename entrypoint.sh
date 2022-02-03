#!/bin/sh -l

echo "Starting"

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

DESTINATION_GITHUB_USERNAME="${1}"
DESTINATION_REPOSITORY_NAME="${2}"
USER_EMAIL="${3}"
USER_NAME="${4}"

echo "Cleaning temp folder"
rm -rf mybus

echo "Setup git config"
git config --global user.email "$USER_EMAIL"
git config --global user.name "$USER_NAME"

# Setup git
echo "Cloning source repository"
git clone --single-branch --branch dev "https://$USER_NAME:$API_TOKEN_GITHUB@github.com/LACMTA/mybus.git" "mybus"

echo "Adding destination repository as remote"
git remote add mybus-dev "https://$USER_NAME:$API_TOKEN_GITHUB@github.com/LACMTA/mybus-dev.git"

echo "Pushing to destination repository"
git push mybus-dev dev


echo "Done"


