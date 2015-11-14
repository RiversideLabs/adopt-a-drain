# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT

apt-get update
apt-get install --assume-yes git nodejs ruby1.9.1 ruby1.9.1-dev g++ libxml2-dev libxslt1-dev postgresql-9.3 libpq-dev libsqlite3-dev
gem install bundle

su - postgres
createdb adopt_a_thing_development
echo "create user dev with password 'dev';"|psql postgres
echo "alter database adopt_a_thing_development owner to dev;"|psql postgres
exit

# installs heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

cd /vagrant
bundle install
bundle exec rake db:schema:load
bundle exec rake db:seed
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu Trusty 64 (14.04) box.
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Provision using inline script defined above.
  config.vm.provision "shell", inline: $script
end
