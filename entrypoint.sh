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

rm -rf aapi
rm -rf hcm

echo "Cloning destination git repository"
# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone --single-branch --branch master "https://$API_TOKEN_GITHUB@github.com/$REPO_USERNAME/$GITHUB_REPO.git" "aapi"

git clone --single-branch --branch master "https://$API_TOKEN_GITHUB@github.com/IDREsandbox/hatecrimemap.git" "hcm"

echo "making sure data folder exists"
mkdir -p hcm/data/aapi/

echo "Copying contents to to git repo"
cp -r aapi/data/* hcm/data/aapi

cd hcm

git add data/

echo "$DATESTAMP"
echo "Adding git commit"
  git commit -m "Update from https://github.com/$GITHUB_REPOSITORY/ on $DATESTAMP"
echo "Pushing git commit"
git push

echo "Done"
