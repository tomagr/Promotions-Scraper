set :rails_env, 'production'
set :branch, 'production'

set :deploy_to, '/srv/rails/scraper'

server '174.129.91.31', user: 'deploy', roles: %w{web app}
