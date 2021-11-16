#!/bin/sh -l

echo "Starts"
FOLDER="$1"
GITHUB_USERNAME="$2"
GITHUB_REPO="$3"
USER_EMAIL="$4"
REPO_USERNAME="$5"
DATESTAMP=`date +"%D"`
if [ -z "$REPO_USERNAME" ]
then
  REPO_USERNAME=$GITHUB_USERNAME
fi

CLONE_DIR=$(mktemp -d)

echo "cleaning tmp folders"

rm -rf mybus

echo "Cloning destination git repository"
# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone --single-branch --branch dev "https://$API_TOKEN_GITHUB@github.com/$REPO_USERNAME/$GITHUB_REPO.git" "mybus"

git remote add mybus-dev "https://$API_TOKEN_GITHUB@github.com/LACMTA/mybus-dev.git"
git push mybus-dev dev

echo "Done"
