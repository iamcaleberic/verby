[![Build Status](https://travis-ci.org/iamcaleberic/verby.svg?branch=master)](https://travis-ci.org/iamcaleberic/verby)

# Verby
Blogger and writers content  ```https://verby.io```
  > * Make sure you have ``` Ruby 2.3.1 ``` , ```Rails 4.2.6 ``` , ```Bundler``` and ```Redis``` Installed.

#### Running

Run ``` Bundle Install ``` to install Gems / Dependencies

If you dont have redis
Run ```apt-get install redis-server``` as superuser

Run ```redis-server ``` on new terminal instance

Alter ```config/database.yml`` to add favorite database

Run ```rake db:create ``` to create database

Run ```rake db:migrate ``` to migrate data

Run ``` rails server ```  to serve on  ```localhost:3000```

Open ```http://localhost:3000``` on browser
