echo 'export PATH=$HOME/.rbenv/bin:$PATH' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

export PATH=$HOME/.rbenv/bin:$PATH
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
eval "$(rbenv init -)"
rbenv install 2.5.3
rbenv shell 2.5.3
gem install bundler

cd /vagrant
bundle install
rbenv rehash
