set :application, "happy"
set :repository,  "git://github.com/hiroshi/happy"
set :deploy_to, "/var/www/happy"
set :scm, :git
set :deploy_via, :remote_cache

server "silent.yakitara.com", :app, :web, :db, :primary => true
set :user, "www-data"
set :use_sudo, false
