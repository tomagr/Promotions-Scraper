# paths

# To generate unicorn on console:
# unicorn_rails -c /srv/rails/Scan/current/config/unicorn/unicorn.rb -D
root = "/srv/rails/scraper/current"
working_directory root
pid "#{root}/tmp/ids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.scraper.sock"
worker_processes 2
timeout 30

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end