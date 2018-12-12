#!/bin/bash

RUBY_VERSION=2.5.3
APP_DIR=/vagrant

# setup .bashrc for rbenv
if ! grep 'rbenv init' $HOME/.bashrc; then
    cat >>$HOME/.bashrc <<'END'
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
END
fi

# install rbenv
export PATH=$HOME/.rbenv/bin:$PATH
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
eval "$(rbenv init -)"

# install a Ruby
rbenv install --skip-existing "$RUBY_VERSION"
rbenv shell "$RUBY_VERSION"
gem install bundler

# install app dependencies
cd "$APP_DIR"
bundle install
rbenv rehash
