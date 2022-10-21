
set :application, 'Scraper'
set :repo_url, 'git@gitlab.com:agrimbautomas/Scraper.git'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
                                               'vendor/bundle', 'public/system', 'key',
																							 'certificates', 'challenge', 'config/settings')
set :keep_releases, 1
set :rvm_ruby_version, '3.0.1'
#
namespace :puma do
  Rake::Task[:restart].clear_actions

  desc 'Force puma restart'
  task :restart do
    invoke 'puma:stop'
    invoke 'puma:start'
  end
end