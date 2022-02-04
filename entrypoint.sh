#!/bin/sh -l

echo "Starting"


set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable
#!/bin/sh -l

EMAIL="${1}"
USERNAME="${2}"
API_TOKEN_GITHUB="${3}"

echo "cleaning tmp folders"

rm -rf mybus


echo "Cloning source repository"
# Setup git

git config --unset-all http.https://github.com/.extraheader
git config --global user.email ${EMAIL} 
git config --global user.name "${USERNAME}"

git clone --single-branch --branch dev "https://$API_TOKEN_GITHUB@github.com/LACMTA/mybus.git" "mybus"

# echo "$DESTINATION_GITHUB_USERNAME"
# echo "$DESTINATION_GITHUB_EMAIL"

# echo "Adding destination repository as remote"
# git remote add mybus-dev "https://$API_TOKEN_GITHUB@github.com/LACMTA/mybus-dev.git"

echo "Pushing to destination repository"
git push "https://$API_TOKEN_GITHUB@github.com/LACMTA/mybus-dev.git" dev


echo "Done"


