#!/bin/sh

# exit script, if error
set -e

# defne colors
RED=`tput setaf 1`
GREEN=`tput setaf 2`
NOCOLOR=`tput sgr0`


echo "${GREEN}Running N42 Bootstrap Specialized (2017-01-23)${NOCOLOR}"


# Guard to update brew only once and only if necessary
NEEDS_TO_UPDATE_BREW=1

installDependencyWithBrew(){
  if [ $NEEDS_TO_UPDATE_BREW -eq 1 ]; then
    echo ""
    echo  "${GREEN} UPDATING BREW ${NOCOLOR}";

    # update brew to keep dependencies up to date
    brew update || echo "${RED} FAILED TO UPDATE BREW ${NOCOLOR}";
    NEEDS_TO_UPDATE_BREW=0
  fi

  echo ""
  echo  "${GREEN} INSTALLING $1 WITH BREW ${NOCOLOR}";

  # install dependency, if is not installed
  brew list $1 || brew install $1 || echo "${RED} FAILED TO INSTALL $1 ${NOCOLOR}";

  # upgrade dependency, if it is outdated
  brew outdated $1 || brew upgrade $1 || echo "${RED} FAILED TO UPGRADE $1 ${NOCOLOR}";
}

installDependencyWithBrewCask(){
  # install dependency, if is not installed
  brew cask list $1 || brew cask install $1 || echo "${RED} FAILED TO INSTALL $1 ${NOCOLOR}";
}

installDependencyWithGem(){
  gem list -i $1 || gem install $1 || echo "${RED} FAILED TO INSTALL $1 ${NOCOLOR}";
}

installDependencyWithNpmGlobally(){
  npm ls $1 --parseable=true --global=true || npm install -g $1 || echo "${RED} FAILED TO INSTALL $1 ${NOCOLOR}";
}


# =========================================+
# ========= PROJECT DEPENDENCIES  =========+
# =========================================+



# =========================+
# ======== POSTGRES =======+
# =========================+
brew cask install postgres || echo "${RED} FAILED TO INSTALL POSTGRES ${NOCOLOR}";
echo "${GREEN}It may be usefull to add export PATH=\$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin to your .zshrc The version (here 9.4) depends on your version of postgres: postgres --version${NOCOLOR}"


# =========================+
# ======== FOREMAN ========+
# =========================+
installDependencyWithGem foreman


# =========================+
# ======== Docker ========+
# =========================+
installDependencyWithBrewCask docker


# call scripts in subfolders
for file in $(find ./*/ -name "${BOOTSTRAP_FILE}" -maxdepth 1); do
  CURRENT_PWD=$(pwd)
  cd $(dirname $file)
  source "${BOOTSTRAP_FILE}"
  cd "${CURRENT_PWD}"
done
