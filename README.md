
## Requirements

---
for initial project setup call and follow instructions:
```bash
sh bootstrap.sh
```
You may call this at any time to fix and install missing dependencies

---

### Brew
check if you have it: ```brew -v```
You will need brew installed:
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


### rbenv
check if you have it: ```rbenv -v```
Install:
```bash
brew update
brew install rbenv
```
Make sure you add the following to your .bashrc | .zshrc :
```bash
cd ~/
eval "$(rbenv init -)"
export PATH="./bin:$PATH"
export PATH=$HOME/.rbenv/bin:$PATH
```
restart your terminal

### Ruby
install ruby with rbenv:
```bash
rbenv install
rbenv rehash
```

### Bundler
We use bundler to manage all our dependencies
Install:
```bash
  gem install bundler
```

### Postgres
The database <3:
check if installed: ```postgres --version```
Install:
```bash
brew cask install postgres
```
It may be usefull to add ```export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin``` to your .zshrc
The version (here **9.4**) depends on your version of postgres ```postgres --version```


### Foreman
We use foreman to start our development systems
Check if installed: ```foreman -v```
Install:
```bash
gem install foreman
```


## Initial Setup
* bundle install
* rake db:setup
* Generate seed data: ```bundle exec rake seed:reset```
* start development servers: ```foreman start```

## Future Updates

* bundle install
* rake db:migrate
* restart your development servers (kill foreman and start again)


## Generate Test Content

```
rake seed:reset
```
To configure edit lib/tasks/seed.rake
