require "rvm/capistrano"
set :rvm_ruby_string, 'default'

# Bundler

require "bundler/capistrano"

# General

set :application, "capteste"
set :user, "deployer"
set :port, 30000
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :copy

set :use_sudo, false

# Git

set :scm, :git
set :repository,  "git@github.com:matthewcopeland/capteste.git"
set :branch, "master"

# VPS

role :web, "173.255.252.56"
role :app, "173.255.252.56"
role :db,  "173.255.252.56", :primary => true
role :db,  "173.255.252.56"

# Passenger

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end

require 'capistrano_recipes'

