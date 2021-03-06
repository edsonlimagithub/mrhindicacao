set :application, "mrhindicacao"
set :rails_env, "development"
set :repository,  "git@github.com:edsonlimagithub/mrhindicacao.git"
set :scm, "git"
set :deploy_to, "/var/www/mrhindicacao"
set :port, 2345 

#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "50.116.36.53"                          # Your HTTP server, Apache/etc
role :app, "50.116.36.53"                          # This may be the same as your `Web` server
role :db,  "50.116.36.53", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "deployer"
set :use_sudo, false
set :deploy_via, :copy

set :normalize_asset_timestamps, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end