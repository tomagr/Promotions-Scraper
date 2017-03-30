# config valid only for current version of Capistrano
lock '3.7.1'

set :application, 'Scraper'
set :repo_url, 'git@bitbucket.org:agrimbautomas/scraper.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp


# Default value for :scm is :git
#set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
                                               'vendor/bundle', 'public/system', 'key', 'certificates', 'challenge')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 1


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end


  desc 'Update Cron Jobs'
  task :update_crontabs do
    on roles(:app), in: :sequence, wait: 5 do
      exec 'whenever --update-crontab'
    end
  end

  #TODO Implement
  #/usr/local/rvm/bin/rvm default do bundle exec  whenever --update-crontab

  after :publishing, :restart

  #after :restart, :clear_cache do
   # on roles(:web), in: :groups, limit: 3, wait: 10 do
    #  exec 'whenever --update-crontab'
    #end
  #end

end
